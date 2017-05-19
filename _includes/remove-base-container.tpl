{*
 * removes the container-class from content-main
 *
 * to use, replace the content of the block 'frontend_index_content_main'
 * with an include to this file
 *}
<div class="content-main--wrapper">
    <section class="content-main block-group">

        {* Breadcrumb *}
        {block name='frontend_index_breadcrumb'}
            {if count($sBreadcrumb)}
                <div class="container">
                    <nav class="content--breadcrumb block">
                        {block name='frontend_index_breadcrumb_inner'}
                            {include file='frontend/index/breadcrumb.tpl'}
                        {/block}
                    </nav>
                </div>
            {/if}
        {/block}

        {* Content top container *}
        {block name="frontend_index_content_top"}{/block}

        <div class="content-main--inner">

            {* Sidebar left *}
            {block name='frontend_index_content_left'}
                {include file='frontend/index/sidebar.tpl'}
            {/block}

            {* Main content *}
            {block name='frontend_index_content_wrapper'}
                <div class="content--wrapper">
                    {block name='frontend_index_content'}{/block}
                </div>
            {/block}

            {* Sidebar right *}
            {block name='frontend_index_content_right'}{/block}

            {* Last seen articles *}
            {block name='frontend_index_left_last_articles'}{/block}
        </div>
    </section>
</div>
