(function(){var a,b;a=window.jQuery;b=a(window);a.fn.stick_in_parent=function(m){var c,d,e,f,g,h,j,k,l,n,o,p,q;if(m==null){m={}}q=m.sticky_class,h=m.inner_scrolling,p=m.recalc_every,o=m.parent,l=m.offset_top,k=m.spacer,e=m.bottoming;if(l==null){l=0}if(o==null){o=void 0}if(h==null){h=true}if(q==null){q="is_stuck"}c=a(document);if(e==null){e=true}n=function(s){var i,r,t;if(window.getComputedStyle){i=s[0];r=window.getComputedStyle(s[0]);t=parseFloat(r.getPropertyValue("width"))+parseFloat(r.getPropertyValue("margin-left"))+parseFloat(r.getPropertyValue("margin-right"));if(r.getPropertyValue("box-sizing")!=="border-box"){t+=parseFloat(r.getPropertyValue("border-left-width"))+parseFloat(r.getPropertyValue("border-right-width"))+parseFloat(r.getPropertyValue("padding-left"))+parseFloat(r.getPropertyValue("padding-right"))}return t}else{return s.outerWidth(true)}};f=function(u,A,D,C,J,w,t,s){var i,r,v,x,y,z,B,E,F,G,H,I;if(u.data("sticky_kit")){return}u.data("sticky_kit",true);y=c.height();B=u.parent();if(o!=null){B=B.closest(o)}if(!B.length){throw"failed to find stick parent"}v=false;i=false;H=k!=null?k&&u.closest(k):a("<div />");if(H){H.css("position",u.css("position"))}E=function(){var K,L,M;if(s){return}y=c.height();K=parseInt(B.css("border-top-width"),10);L=parseInt(B.css("padding-top"),10);A=parseInt(B.css("padding-bottom"),10);D=B.offset().top+K+L;C=B.height();if(v){v=false;i=false;if(k==null){u.insertAfter(H);H.detach()}u.css({position:"",top:"",width:"",bottom:""}).removeClass(q);M=true}J=u.offset().top-(parseInt(u.css("margin-top"),10)||0)-l;w=u.outerHeight(true);t=u.css("float");if(H){H.css({width:n(u),height:w,display:u.css("display"),"vertical-align":u.css("vertical-align"),"float":t})}if(M){return I()}};E();if(w===C){return}x=void 0;z=l;G=p;I=function(){var K,L,M,N,O,P;if(s){return}M=false;if(G!=null){G-=1;if(G<=0){G=p;E();M=true}}if(!M&&c.height()!==y){E();M=true}N=b.scrollTop();if(x!=null){L=N-x}x=N;if(v){if(e){O=N+w+z>C+D;if(i&&!O){i=false;u.css({position:"fixed",bottom:"",top:z}).trigger("sticky_kit:unbottom")}}if(N<J){v=false;z=l;if(k==null){if(t==="left"||t==="right"){u.insertAfter(H)}H.detach()}K={position:"",width:"",top:""};u.css(K).removeClass(q).trigger("sticky_kit:unstick")}if(h){P=b.height();if(w+l>P){if(!i){z-=L;z=Math.max(P-w,z);z=Math.min(l,z);if(v){u.css({top:z+"px"})}}}}}else{if(N>J){v=true;K={position:"fixed",top:z};K.width=u.css("box-sizing")==="border-box"?u.outerWidth()+"px":u.width()+"px";u.css(K).addClass(q);if(k==null){u.after(H);if(t==="left"||t==="right"){H.append(u)}}u.trigger("sticky_kit:stick")}}if(v&&e){if(O==null){O=N+w+z>C+D}if(!i&&O){i=true;if(B.css("position")==="static"){B.css({position:"relative"})}return u.css({position:"absolute",bottom:A,top:"auto"}).trigger("sticky_kit:bottom")}}};F=function(){E();return I()};r=function(){s=true;b.off("touchmove",I);b.off("scroll",I);b.off("resize",F);a(document.body).off("sticky_kit:recalc",F);u.off("sticky_kit:detach",r);u.removeData("sticky_kit");u.css({position:"",bottom:"",top:"",width:""});B.position("position","");if(v){if(k==null){if(t==="left"||t==="right"){u.insertAfter(H)}H.remove()}return u.removeClass(q)}};b.on("touchmove",I);b.on("scroll",I);b.on("resize",F);a(document.body).on("sticky_kit:recalc",F);u.on("sticky_kit:detach",r);return setTimeout(I,0)};for(g=0,j=this.length;g<j;g++){d=this[g];f(a(d))}return this}}).call(this);