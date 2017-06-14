{**
 * Build your very own background-image: url('');
 *
 * Handles responsiveness & retina-screens
 *
 * params:
 * - $selector String               css-selector for the background-image
 * - $image Array                   (eg. sArticle.image/sArticle.images[0])
 * - $sizes Array                   associative array mapping `screenwidth` => `imagewidth` in px
 * - $scoped Bool, optional         whether or not the <style> is scoped. defaults to true
 * - $useRetina Bool, optional      enables retina if true. defaults to true
 *}

{if $scoped !== false}
    {$scoped = true}
{/if}

{if $useRetina !== false}
    {$useRetina = true}
{/if}

{$breakpointImages = []}

{if $image}
    {foreach $sizes as $screenWidth => $imageWidth}
        {$foundImage = null}

        {* find the optimal thumbnail *}
        {foreach $image.thumbnails as $thumbnail}
            {* use image if we haven't got one (fallback) or the
             * thumbnail width lies between the found width and the required width
             *}
            {if $thumbnail.maxWidth >= $imageWidth && (!$foundImage || $thumbnail.maxWidth < $foundImage.maxWidth)}
                {$foundImage = $thumbnail}
            {/if}
        {/foreach}

        {$breakpointImages[$screenWidth] = $foundImage}
    {/foreach}
{/if}

<style {if $scoped}scoped{/if}>
    {foreach $breakpointImages as $screenWidth => $image}
        @media (min-width: {$screenWidth}px) {
            {$selector} { background-image: url('{link file=$image.source}'); }
        }

        {if $useRetina && $image.retinaSource}
            @media
                (min-width: {$screenWidth}px) and (-webkit-min-device-pixel-ratio: 2),
                (min-width: {$screenWidth}px) and (min-resolution: 192dpi) {

                {$selector} { background-image: url('{link file=$image.retinaSource}'); }
            }
        {/if}
    {/foreach}
</style>
