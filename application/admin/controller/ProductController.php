<?php
namespace app\admin\controller;

use app\admin\model\ProductModel;
use app\admin\model\ProductTagModel;
use think\facade\Env;
use Endroid\QrCode\QrCode;
use Endroid\QrCode\ErrorCorrectionLevel;
use think\Db;
class ProductController extends Base
{
    public function index()
    {
        if(request()->isAjax()){

            $param = input('param.');

            $limit = $param['pageSize'];
            $offset = ($param['pageNumber'] - 1) * $limit;

            $where = [];
            if (!empty($param['searchText'])) {
                $where[] = ['name','like', '%' . $param['searchText'] . '%'];
            }
            // dump($where);die;
            $product = new ProductModel();
            $selectResult = $product->getProductsByWhere($where, $offset, $limit);

            foreach($selectResult as $key=>$vo){
                $selectResult[$key]['logo'] = '<img src="' . $vo['logo'] . '" width="40px" height="40px">';
                $selectResult[$key]['operate'] = showOperate($this->makeButton($vo['id']));
            }

            $return['total'] = $product->getAllProducts($where);  // 总数据
            $return['rows'] = $selectResult;

            return json($return);
        }

        return $this->fetch();
    }

    // 添加产品
    public function productAdd()
    {
        if(request()->isPost()){
            $param = input('post.');

            unset($param['file']);

            $result = $this->validate($param, 'Product');
            if(true !== $result){
                return json(msg(-1, '', $result));
            }
            // 启动事务
            Db::startTrans();
            try {
                // dump($param);die;
                $product = new ProductModel();
                $product->data($param);
                if(!$product->save()){
                    Db::rollback();
                    $this->error('添加失败');
                }
                // tags 处理
                if (!empty($param['tags'])) {
                    $product->editTags($param['tags']);
                }
                // 生成二维码
                $this->createQr($product->id);
                // 提交事务
                Db::commit();
                return $this->success('添加成功');
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                $this->error('添加失败');
            }
        }else{
            $this->assign(config('dic.'));
        }

        return $this->fetch();
    }

    public function productEdit()
    {
        $product = new ProductModel();
        $id = input('param.id');
        $product = $product->get($id);
        if (empty($product)) {
            $this->error('产品不存在');
        }
        if(request()->isPost()){
            $param = input('post.');
            unset($param['file']);

            // dump($param);die;
            $result = $this->validate($param, 'Product');
            if(true !== $result){
                return json(msg(-1, '', $result));
            }

            // 启动事务
            Db::startTrans();
            try {

                $product->data($param);
                if($product->save()===false){
                    Db::rollback();
                    $this->error('修改失败');
                }
                // tags 处理
                if (!empty($param['tags'])) {
                    $product->editTags($param['tags']);
                }
                // 生成二维码
                $this->createQr($product->id);
                // 提交事务
                Db::commit();
                return $this->success('修改成功',url('product/index'));
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                $this->error('修改失败');
            }
        }

        $tags = [];
        foreach ($product->tags as $tag) {
            $tags[] = $tag['tag_name'];
        }
        $product->tags = implode(',', $tags);
        $this->assign([
            'product' => $product->toArray()
        ]);
        $this->assign(config('dic.'));
        return $this->fetch();
    }

    public function productDel()
    {
        $id = input('param.id');

        $product = new ProductModel();
        $flag = $product->delProduct($id);
        return json(msg($flag['code'], $flag['data'], $flag['msg']));
    }

    // 上传缩略图
    public function uploadImg()
    {
        if(request()->isAjax()){

            $file = request()->file('file');
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->rule('uniqid')->move(Env::get('root_path') . 'public' . DIRECTORY_SEPARATOR . 'upload' . DIRECTORY_SEPARATOR . 'logo');
            if($info){
                $src =  '/upload/logo' . '/' . $info->getFilename();
                return json(msg(0, ['src' => $src], ''));
            }else{
                // 上传失败获取错误信息
                return json(msg(-1, '', $file->getError()));
            }
        }
    }

    // 生成二维码图片
    private function createQr($id)
    {   
        $qrCode = new QrCode();
        $qrCode->setSize(250);
        $qrCode
            ->setText("http://".request()->server()['HTTP_HOST']."/detail/{$id}.html")
            ->setWriterByName('png')
            ->setMargin(10)
            ->setEncoding('UTF-8')
            ->setErrorCorrectionLevel(ErrorCorrectionLevel::HIGH)
            ->setForegroundColor(['r' => 0, 'g' => 0, 'b' => 0])
            ->setBackgroundColor(['r' => 255, 'g' => 255, 'b' => 255])
            // ->setLabel('Scan the code', 16, __DIR__.'/../assets/noto_sans.otf', LabelAlignment::CENTER)
            ->setLogoPath('./static/index/picture/p_portrait.png')
            ->setLogoWidth(50)
            ->setValidateResult(false);

        // header('Content-Type: '.$qrCode->getContentType());
        // echo $qrCode->writeString();
        return $qrCode->writeFile("./upload/qr/{$id}.png");
    }

    /**
     * 拼装操作按钮
     * @param $id
     * @return array
     */
    private function makeButton($id)
    {
        return [
            '编辑' => [
                'auth' => 'product/productedit',
                'href' => url('product/productedit', ['id' => $id]),
                'btnStyle' => 'primary',
                'icon' => 'fa fa-paste'
            ]
        ];
    }
}
