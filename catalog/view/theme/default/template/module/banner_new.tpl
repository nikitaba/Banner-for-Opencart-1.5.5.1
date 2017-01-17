<style>
    .box {
        overflow: hidden;
        margin: auto;
    }
    .banner_new a {
        display: inline;
    }
    .banner_new {
        border: none;
        padding: 0px;
        margin: 0 0 10px 0;
        text-align: center;
        float: left;
    }
    .tile_img {
        position: relative;
        overflow: hidden;
    }
    .tile_description {
        position: absolute;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,.8);
        color: #fff;
        font-size: 13px;
        font-weight: 600;
        text-align: center;
        text-transform: uppercase;
        transition: bottom .25s ease;
    }
    .banner_new a div div span {
        display: block;
        height: 30px;
    }
    .tile_collection_name {
        position: absolute;
        bottom: 0;
        left: 0;
        padding: 0 24px;
        background: rgba(0,0,0,.8);
        color: #fff;
        font-size: 24px;
        font-weight: 600;
        line-height: 50px;
        transition: bottom .25s ease;
    }
    .tile_img:hover > .tile_collection_name{
        bottom: -52px;
    }
    .tile_img:hover > .tile_description{
        bottom: 0px !important;
    }
    .banner_new a div img {
        padding: 0px;
        border: none;
    }
</style>
<?php foreach ($banners as $banner) { ?>
    <div class="box" style="width: <?php echo $banner['image_width']; ?>px;">
        <?php if ($banner['status']) { ?>
            <div class="banner_new" style="width: <?php echo $banner['image_width']; ?>px; height: <?php echo $banner['image_height']; ?>px;">
                <a href="<?php echo $banner['link']; ?>" >
                    <div class="tile_img" style="width: <?php echo $banner['image_width']; ?>px; height: <?php echo $banner['image_height']; ?>px;">
                        <div class="tile_description" style="bottom: <?php echo $banner['image_height']; ?>px;">
                            <span style="margin-top: <?php echo $banner['image_height']/2-10; ?>px;"><?php echo $banner['description']; ?></span>
                        </div>
                        <img src="<?php echo $banner['thumb']; ?>" alt="<?php echo $banner['title']; ?>" >
                        <span class="tile_collection_name" ><?php echo $banner['title']; ?></span>
                    </div>
                </a>
            </div>
        <?php } ?>
    </div>
<?php } ?>