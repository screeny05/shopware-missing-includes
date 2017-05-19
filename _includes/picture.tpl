{**
 * Build your very own <picture>
 *
 * Handles fallbacks, retina-screens & alt-attrs
 *
 * params:
 * - $image Array                   (eg. sArticle.image/sArticle.images[0])
 * - $alt String, optional          alt-attribute, gets overriden by $image.description if available
 * - $src Array<Number>, optional   only use these sizes. defaults to using all
 * - $sizes String                  sizes-attribute
 * - $useRetina Bool, optional      enables retina if true. defaults to true
 * - $imgClass String, optional     add a class to the <img>-element
 * - $useOrg Bool, optional         use the original sized picture. defaults to false
 *}

{$srcSetRetina = ""}
{$srcSet = ""}
{$srcBase = {link file='frontend/_public/src/img/no-picture.jpg'}}

{$sizeSet = ""}
{$sizeSetRetina = ""}

{$isFirstSrc = true}
{$isFirstSrcRetina = true}

{if $useRetina !== false}
    {$useRetina = true}
{/if}

{if $image}
    {$srcBase = $image.source}

    {if $image.description}
        {$alt = $image.description}
    {/if}

    {foreach $image.thumbnails as $sourceIndex => $sourceImage}
        {if $src|count > 0 && !$sourceIndex|in_array:$src}
            {continue}
        {/if}

        {$srcSet = "{$srcSet}{if !$isFirstSrc}, {/if}{$sourceImage.source} {$sourceImage.maxWidth}w"}
        {$sizeSet = "{$sizeSet}"}
        {if $isFirstSource}
            {$srcBase = $sourceImage.source}
        {/if}
        {$isFirstSrc = false}

        {if $useRetina && $sourceImage.retinaSource}
            {$srcSetRetina = "{$srcSetRetina}{if !$isFirstSrcRetina}, {/if}{$sourceImage.retinaSource} {$sourceImage.maxWidth}w"}
            {$isFirstSrcRetina = false}
        {/if}
    {/foreach}

    {if $useOrg}
        {$srcSet = "{$srcSet}{if !$isFirstSrc}, {/if}{$image.source} {$image.width}w"}
        {$srcSetRetina = "{$srcSetRetina}{if !$isFirstSrc}, {/if}{$image.source} {$image.width}w"}
        {$isFirstSrc = false}
        {$isFirstSrcRetina = false}
    {/if}
{/if}


{if $srcSet}
    <picture>
        {if $srcSetRetina}
            <source sizes="{$sizes}" srcset="{$srcSetRetina}" media="(min-resolution: 192dpi)"/>
        {/if}
        <source sizes="{$sizes}" srcset="{$srcSet}"/>
        <img src="{$srcBase}" class="{$imgClass}" alt="{$alt}"/>
    </picture>
{else}
    <img src="{$srcBase}" class="{$imgClass}" alt="{$alt}"/>
{/if}
