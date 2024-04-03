<#import "blocks/template.ftlh" as t>
<@t.template user>

    <hr>
    <p><h1 style="text-align: center">${offer.name} | ${offer.price} ₽</h1></p>
    <p style="text-align: center">${offer.description}</p>
    <hr>

</@t.template>
