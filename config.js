(function(){define([],function(){return function(a){var b,c,d,e,f,g;null==a&&(a="cdn"),d=["cdn.jquery","cdn.underscore","cdn.backbone","cdn.marionette","cdn.underscore.mixins"],f={"cdn.backbone":"backbone-1.0.0","cdn.marionette":"backbone.marionette-1.1.0","cdn.jquery":"jquery-1.10.2","cdn.processing":"processing-1.4.1","cdn.raphael":"raphael-2.1.2","cdn.underscore":"underscore-1.5.2","cdn.underscore.mixins":"underscore.mixins","cdn.jqueryui":"jquery.ui-1.9.2"},b={"cdn.lodash":"cdn.underscore"},c={paths:{},map:{"*":b},shim:{"cdn.backbone":{deps:["cdn.underscore","cdn.jquery"],exports:"Backbone"},"cdn.marionette":{deps:["cdn.backbone"],exports:"Backbone.Marionette"},"cdn.jquery":{exports:"$"},"cdn.processing":{exports:"Processing"},"cdn.raphael":{exports:"Raphael"},"cdn.underscore":{exports:"_",deps:["cdn.underscore.mixins"],init:function(a){return _.mixin(a)}},"cdn.jqueryui":{deps:["cdn.jquery"],exports:"$"}}};for(e in f)g=f[e],d.indexOf(e)>-1&&(g="core.min"),c.paths[e]=""+a+"/lib/"+g;return a="undefined"!=typeof window&&"https:"===window.location.protocol?"https://c328740.ssl.cf1.rackcdn.com/mathjax/latest/MathJax.js?config=TeX-MML-AM_HTMLorMML.js":"http://cdn.mathjax.org/mathjax/2.0-latest/MathJax.js?config=TeX-MML-AM_HTMLorMML.js",c.paths["cdn.mathjax"]=a,require.config&&require.config(c),c.rawPaths=f,c.coreDeps=d,c}})}).call(this);