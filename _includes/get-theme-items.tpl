{**
 * get iterable configurations from $theme as an array
 *
 * use if you have theme variables like this:
 * - image_footer_1
 * - image_footer_2
 * - image_footer_n
 *
 * params:
 * - $start Number   count-start for the items
 * - $end Number     count-end for the items
 * - $prefix String  prefix of the key identifying the items
 *
 * assigns:
 * - $themeConfigItems Array<string>  Array of items found
 *}

{if !$start}
    {$start = 0}
{/if}

{if !$end}
    {$end = 1}
{/if}

{$items = []}

{if !$prefix}
    {$prefix = 'item_'}
{/if}

{for $i = $start to $end}
    {$item = $theme[$prefix|cat:$i]}
    {if $item}
        {$items[$i] = $item}
    {/if}
{/for}

{assign var='themeConfigItems' value=$items scope='global'}
