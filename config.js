(function(){define([],function(){return function(a){var b;return null==a&&(a="cdn"),b={coreDependencies:{"cdn.jquery":"lib/src/jquery-1.10.2","cdn.backbone":"lib/src/backbone-1.0.0","cdn.marionette":"lib/src/backbone.marionette-1.1.0","cdn.underscore.mixins":"lib/src/underscore.mixins","cdn.underscore":"lib/src/underscore-1.5.2"},paths:{"cdn.backbone":""+a+"/lib/dist/core.min","cdn.marionette":""+a+"/lib/dist/core.min","cdn.jquery":""+a+"/lib/dist/core.min","cdn.underscore":""+a+"/lib/dist/core.min","cdn.underscore.mixins":""+a+"/lib/dist/core.min","cdn.processing":""+a+"/lib/dist/processing-1.4.1","cdn.raphael":""+a+"/lib/dist/raphael-2.1.2","cdn.jqueryui":""+a+"/lib/dist/jquery.ui-1.9.2","cdn.mathjax":"https://c328740.ssl.cf1.rackcdn.com/mathjax/latest/MathJax.js?config=TeX-MML-AM_HTMLorMML.js"},map:{"*":{"cdn.lodash":"cdn.underscore"}},shim:{"cdn.backbone":{deps:["cdn.underscore","cdn.jquery"],exports:"Backbone"},"cdn.marionette":{deps:["cdn.backbone"],exports:"Backbone.Marionette"},"cdn.jquery":{exports:"$"},"cdn.processing":{exports:"Processing"},"cdn.raphael":{exports:"Raphael"},"cdn.underscore":{exports:"_",deps:["cdn.underscore.mixins"],init:function(a){return _.mixin(a)}},"cdn.jqueryui":{deps:["cdn.jquery"],exports:"$"}}},require.config&&require.config(b),b}})}).call(this);