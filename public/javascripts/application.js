// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

Event.observe(window, 'load', function() {
    fadeout.delay(1.0);
    Element.hide.delay(3.0, "notice");
    Element.hide.delay(3.0, "alert");
});

function fadeout(){
    new Effect.Opacity("notice", {duration:1.5, from:1.0, to:0.0});
    new Effect.Opacity("alert", {duration:1.5, from:1.0, to:0.0});
    
}