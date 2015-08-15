document.ready(function() {
    var vat_included_price,
        price,
        vat;

    price = $("#price");
    vat = $("#vat").html();
    vat_included_price = $("#vat_included_price");

    price.keyup(function() {
        vat_included_price.html(this.html() * vat);
    });
});

