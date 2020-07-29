#!/usr/bin/env phantomjs

var page = require('webpage').create(),
    system = require('system'),
    fs = require('fs'),
    url = system.args[1],
    output = system.args[2],
    cookieFmt1 = system.args[3],
    cookieFmt2 = system.args[4];

// console.log('cookieFmt1=',cookieFmt1);
// console.log('cookieFmt2=',cookieFmt2);
if (cookieFmt2) { page.customHeaders = page.customHeaders || {}; page.customHeaders.Cookie = cookieFmt2; }
// page.customHeaders = {
//     "X-Test": "foo",
//     "DNT": "1"
// };
if (cookieFmt1) { phantom.addCookie(JSON.parse(cookieFmt1)); }
// phantom.addCookie({
//     'name'     : '',  /* required property */
//     'value'    : '',  /* required property */
//     'domain'   : '',
//     'path'     : '/',                /* required property */
//     'httponly' : true,
//     'secure'   : true,
//     // 'expires'  : (new Date()).getTime() + (1000 * 60 * 60)   /* <-- expires in 1 hour */
// });

phantom.addCookie({
    'name'     : 'JSESSIONID',  /* required property */
    'value'    : '12345678901234567890123456789012',  /* required property */
    'domain'   : 'confluence.company.com',
    'path'     : '/',                /* required property */
    'httponly' : true,
    'secure'   : true,
    // 'expires'  : (new Date()).getTime() + (1000 * 60 * 60)   /* <-- expires in 1 hour */
});


page.paperSize = {
    format: 'A4',
    orientation: 'portrait',
    margin: "1cm", // { top: "1.5cm", bottom: "1cm" },
    footer: {
        height: "1cm",
        contents: phantom.callback(function (pageNum, numPages) {
            return '' +
                '<div style="margin: 0 1cm 0 1cm; font-size: 0.65em">' +
                '   <div style="color: #888; padding:20px 20px 0 10px; border-top: 1px solid #ccc;">' +
                '       <span>REPORT FOOTER</span> ' +
                '       <span style="float:right">' + pageNum + ' / ' + numPages + '</span>' +
                '   </div>' +
                '</div>';
        })
    }
};

page.settings.dpi = "96";

// page.content = fs.read(url);
page.open(url);

// window.setTimeout(function () {
//     page.render(output, {format: 'pdf'});
//     phantom.exit(0);
// }, 2000);


// page.zoomFactor = 0.25;
page.evaluate(function() {
    document.querySelector('body').style.fontSize = '25%';
});

page.onLoadFinished = function() {
  page.render(output, {format: 'pdf'});
  phantom.exit(0);
}
