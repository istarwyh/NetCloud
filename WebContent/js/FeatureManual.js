ark.add("disk.ui.FeatureManual",function(){var _=function(_){this._mViewFlags=0;this._mViewShadowId=disk.obtainId();this._mViewPrevId=disk.obtainId();this._mViewNextId=disk.obtainId();this._mViewCloseId=disk.obtainId();this._mViewShadow=null;this._mViewPrev=null;this._mViewNext=null;this._mPosition=-1;this._mConf=_||{};this._mTimer=null;this._mSugAnimDir=0;if(!$.isArray(this._mConf.stepTargets)){throw new Error("you need specify step targets");}disk.ui.Panel.call(this,this._prebuild());};_.WTE=0;_.ETW=1;_.IN_ANIMATION=2;_.ANIM_OFFSET=50;_.prototype=new disk.ui.Panel();_.constructor=_;_.prototype._prebuild=function(){var _=document.createElement("div"),A=this;_.className="b-panel b-dialog b-feature-manual";document.body.appendChild(_);this.onBuildPane(_);this._mViewShadow=$("#"+this._mViewShadowId).get(0);this._mViewPrev=$("#"+this._mViewPrevId).get(0);this._mViewNext=$("#"+this._mViewNextId).get(0);$("#"+this._mViewCloseId).click(function(){A.setVisible(false);});this._mViewPrev.onclick=function(){A.prev();return false;};this._mViewNext.onclick=function(){A.next();return false;};return{pane:_};};_.prototype.onBuildPane=function(A){var _=[];_.push('<div class="feature-manual-content b-panel">');_.push('<a hidefocus="true" id="'+this._mViewCloseId+'" href="javascript:;" class="b-fm-close" title="\u5173\u95ed" id="'+this._mViewCloseId+'"></a>');_.push('<a hidefocus="true" id="'+this._mViewPrevId+'" href="javascript:;" title="\u4e0a\u4e00\u6b65" class="feature-manual-btn feature-manual-prev"></a>');_.push('<a hidefocus="true" id="'+this._mViewNextId+'" href="javascript:;" title="\u4e0b\u4e00\u6b65" class="feature-manual-btn feature-manual-next"></a>');_.push('</div><div class="feature-manual-shadow b-panel" id="'+this._mViewShadowId+'"></div>');A.innerHTML=_.join("");};_.prototype.prev=function(){var _=this._mPosition,A=this._mConf.stepTargets.length;if(_<=0){if(disk.DEBUG){console.log("can not navigate before 0");}}else{this.dispatchStepEvent(_-1);}};_.prototype.next=function(){var _=this._mPosition,B=this._mConf.stepTargets.length;if(_>=B-1){if(disk.DEBUG){console.log("can not navigate after 0");}if(this._mConf.closeOnExceed===true){this.setVisible(false);}}else{var A=_+1;if(A==3){A++;}this.dispatchStepEvent(A);}};_.prototype._calculateLocation=function(E){var H=$(E).offset(),I=E.offsetWidth,D=E.offsetHeight,A=$(document).width(),G=$(document).height(),B=this._mUI.pane.offsetWidth,C=this._mUI.pane.offsetHeight;this._mSugAnimDir=_.ETW;var J=H.left,F=H.top+D;if(J+B>A){J=J-B+I;this._mSugAnimDir=_.WTE;}if(F+C>G){F-=(C+D);}return[J,F];};_.prototype.onResize=function(){if(this._mTimer==null){var _=this;this._mTimer=new disk.util.TimerService(100,function(){if(disk.DEBUG){console.log("====>FM resize");}_._size();});}else{this._mTimer.interrupt();}this._mTimer.start();};_.prototype._size=function(){this.setLocation(0,0);var B=this._mPosition,A=this._mConf.stepTargets[B],C=true,_=null,D=this;if(A){_=this._calculateLocation(A);this.setLocation(_[0],_[1]);}else{this.setGravity(disk.ui.Panel.CENTER);C=false;}this.onStepEvent(B,this._mViewPrev,this._mViewNext,this._mViewShadow,A,_);if(C){this.setLocation(_[0],_[1]);}};_.prototype.dispatchStepEvent=function(D){if(disk.DEBUG){console.log("navigate to step "+D);}if((this._mViewFlags&_.IN_ANIMATION)==_.IN_ANIMATION){return;}this._mUI.pane.className="b-panel b-dialog b-feature-manual "+(this._mConf.cssPrefix||"feature-manual-step")+D;var B=this._mConf.stepTargets[D],F=true,A=null,H=this;if(B){A=this._calculateLocation(B);this.setLocation(A[0],A[1]);}else{this.setGravity(disk.ui.Panel.CENTER);F=false;}this.onStepEvent(D,this._mViewPrev,this._mViewNext,this._mViewShadow,B,A);if(F){this._mViewFlags|=_.IN_ANIMATION;var C=this._mSugAnimDir==_.ETW?A[0]+_.ANIM_OFFSET:A[0]-_.ANIM_OFFSET,E={left:C+"px",top:A[1]+"px",opacity:0},G={left:A[0]+"px",opacity:1};if($.browser.msie&&$.browser.msie<9){delete E.opacity;delete G.opacity;}$(this._mUI.pane).css(E).animate(G,function(){H._mViewFlags&=~_.IN_ANIMATION;});}this._mPosition=D;};_.prototype.onStepEvent=function(C,_,B,A){};_.prototype.start=function(){this._mPosition++;this.dispatchStepEvent(this._mPosition);this.setVisible(true);};_.prototype.onVisibilityChange=function(_){if(_){this.setGravity(disk.ui.Panel.CENTER);$(this._mUI.pane).addClass("anim-pop-callout");}else{$(this._mUI.pane).removeClass("anim-pop-callout");}};ark.exports("disk.ui.FeatureManual","FeatureManual",_);return _;});