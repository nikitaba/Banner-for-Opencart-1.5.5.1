<?php
class ControllerModuleBannerNew extends Controller {
    protected function index($setting) {

        $this->language->load('module/banner_new');

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->load->model('setting/setting');

        $this->load->model('tool/image');

        $this->load->model('setting/extension');

        $this->data['banners'] = array();

        //getCategories

        $this->load->model('catalog/category');

        if (isset($this->request->post['banner_new_module'])) {
            $categories = explode(',', $this->request->post['banner_new_module']);
        } else {
            $categories = explode(',', $this->config->get('banner_new'));
        }

        $this->data['categories'] = array();

        foreach ($categories as $category) {
            $this->data['categories'] = $this->model_catalog_category->getCategories($category);
        }

        $categories = $this->data['categories'];

        //getProducts

        $this->load->model('catalog/product');

        if (isset($this->request->post['banner_new_module'])) {
            $products = explode(',', $this->request->post['banner_new_module']);
        } else {
            $products = explode(',', $this->config->get('banner_new'));
        }

        $this->data['products'] = array();

        foreach ($products as $product) {
            $this->data['products'] = $this->model_catalog_product->getProducts($product);
        }

        $products = $this->data['products'];

        //getManufacturers

        $this->load->model('catalog/manufacturer');

        if (isset($this->request->post['banner_new_module'])) {
            $manufacturers = explode(',', $this->request->post['banner_new_module']);
        } else {
            $manufacturers = explode(',', $this->config->get('banner_new'));
        }

        $this->data['manufacturers'] = array();

        foreach ($manufacturers as $manufacturer) {
            $this->data['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers($manufacturer);
        }

        $manufacturers = $this->data['manufacturers'];

        foreach ($categories as $category) {
            foreach ($manufacturers as $manufacturer) {
                foreach ($products as $product) {
                    if (trim($setting['category_name']) == trim($category['name']) && trim($setting['category_id']) == trim($category['category_id']) && trim($category['parent_id']) == 0) {
                        $url = $this->url->link('product/category', 'path=' . $category['category_id']);
                        break;
                    } elseif ($setting['category_name'] == $category['name'] && $setting['category_id'] == $category['category_id'] && $category['parent_id'] != 0) {
                        $url = $this->url->link('product/category', 'path=' . $category['parent_id'] . '_' . $category['category_id']);
                        break;
                    } elseif (trim($setting['category_name']) == trim($manufacturer['name']) && trim($setting['category_id']) == trim($manufacturer['manufacturer_id'])) {
                        $url = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['category_id']);
                        break;
                    } elseif (trim($setting['category_name']) == trim($product['name']) && trim($setting['category_id']) == trim($product['product_id'])) {
                        $url = $this->url->link('product/product', 'product_id=' . $product['product_id']);
                        break;
                    }
                }
            }
        }

        if (file_exists(DIR_IMAGE . $setting['image']) && $setting['image'] != '') {
            $image = $setting['image'];
        } else {
            $image = 'no_image.jpg';
        }

        $this->data['banners'][] = array(
            'description'  => $setting['description'],
            'title'        => $setting['title'],
            'link'         => $url,
            'thumb'        => $this->model_tool_image->resize($image, $setting['image_width'], $setting['image_height']),
            'image_width'  => $setting['image_width'],
            'image_height' => $setting['image_height'],
            'layout_id'    => $setting['layout_id'],
            'position'     => $setting['position'],
            'status'       => $setting['status'],
            'sort_order'   => $setting['sort_order']
        );

        $this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/banner_new.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/banner_new.tpl';
        } else {
            $this->template = 'default/template/module/banner_new.tpl';
        }

        $this->render();
    }
}