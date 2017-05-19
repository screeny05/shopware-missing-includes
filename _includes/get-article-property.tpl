{* use this to retrieve an article-property, their attributes and images by name *}
{$foundProperty = false}
{$selectedOptions = []}

{* find property by name *}
{foreach $sArticle.sProperties as $property}
    {if $property.name == $name}
        {$foundProperty = $property}
        {break}
    {/if}
{/foreach}

{if $foundProperty}
    {* find selected options for found property *}
    {$selectedValues = $foundProperty.values|array_keys}
    {foreach $foundProperty.options as $option}
        {if $option.id|in_array:$selectedValues}
            {$selectedOptions[] = $option}
        {/if}
    {/foreach}


    {* find media for selected options *}
    {foreach $selectedOptions as $i => $option}
        {foreach $foundProperty.media as $media}
            {if $media.valueId == $option.id}
                {$selectedOptions[$i].media = $media}
            {/if}
        {/foreach}
    {/foreach}
{/if}

{assign var='articleProperty' value=$selectedOptions scope='global'}
