{*
 * use this to print json-ld meta info
 *
 * http://json-ld.org/learn.html
 *
 * params:
 * - $data Array  associative array containing your metadata.
 *}

{$defaults = [
    '@context' => 'http://schema.org'
]}

{$data = $defaults|array_merge:$data}

<script type="application/ld+json">
    {$data|json_encode}
</script>
