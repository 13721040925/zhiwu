
//攻击次数
var _timeofattack=3;
//当前攻击波数
var 当前第几波=1;
//预备时间
var 预备时间=6.0;

var _已经开始时间=0.000;

var _攻击间隔时间=5.000;

var 定时任务=null;

var 被选中军队的图片路径=null;
var 被选中军队的攻击力=0;
var 被选中军队的攻击力预备时间=0;
var 被选中军队的血量=0;

var 金币数=0.00;

var 是暂停中=false;

function task(){
    //加时间
    _已经开始时间+=0.05;
    if(!是暂停中){
        //加金币
        金币数+=0.053454365768575434;
        document.getElementById("money").innerText=金币数;
        //设置进度条
        setprocess();
        //移动敌人
        enemymove();
        //移动子弹&&计算击中并减去血量&&消除击中过的子弹
        bulletmove();
        //删除过期敌人
        deletenemy();
        //删除射出边界的子弹
        deletbullet();
        //判断发送子弹
        attack();
        //删除过期军人
        deletearmy();
    }
}

//启动定时器//////////////////////////////////////////////////////
function start(){
    //初始化敌人
    initEnemy();
    定时任务 = window.setInterval(task,30);
    window.setTimeout(pophide,3000);
}
//隐藏弹窗
function pophide(){
   document.getElementsByClassName("pop")[0].remove();
}
//暂停//////////////////////////////////////////////////////////
function pause(){
    是暂停中=true;
    alert("暂停成功");
}
//继续///////////////////////////////////////////////////////////
function continuous(){
    是暂停中=false;
}

//先释放第一波敌人
function initEnemy(){
        //释放敌人
        addenemy(6,预备时间,30);
        当前第几波=1;
}
//释放敌人
function addenemy(num,释放开始时间,释放时间和){

   var windowwidth= document.getElementById("main").offsetWidth;
   var left=84.5;
   var 平均释放时间=释放时间和/num;
    for(var n=0;n<num;n++){
        //计算敌人所在行
        var random=parseInt( Math.random()*5+1);
        //计算敌人x轴位置
        var mar_left=parseFloat(windowwidth*left*0.01);
        //初始化释放时间
        var 释放时间=释放开始时间+平均释放时间*n;
        //创建img元素
        var img= document.createElement("img");
        //标签绑定数据 
        if(random==1){
            img.setAttribute("style","left:0%;top:14%;width:5%;height:12%;position:absolute;margin-left:"+mar_left+"px;");
        }else if(random==2){
            img.setAttribute("style","left:0%;top:29%;width:5%;height:12%;position:absolute;margin-left:"+mar_left+"px;");
        }else if(random==3){
            img.setAttribute("style","left:0%;top:45%;width:5%;height:12%;position:absolute;margin-left:"+mar_left+"px;");
        }else if(random==4){
            img.setAttribute("style","left:0%;top:61%;width:5%;height:12%;position:absolute;margin-left:"+mar_left+"px;");
        }else if(random==5){
            img.setAttribute("style","left:0%;top:76%;width:5%;height:12%;position:absolute;margin-left:"+mar_left+"px;");
        }
        img.setAttribute("src","img/11.gif");
        img.setAttribute("data-timeofattack",当前第几波);
        img.setAttribute("data-playtime",释放时间);
        img.setAttribute("data-row",random);
        img.setAttribute("data-left",String(left));
        img.setAttribute("data-bloodnum",100);
        document.getElementsByClassName("enemy")[0].appendChild(img);
        left+=1;
    }
}

//控制敌人位移&&释放下一波敌人&&敌人攻击军人
function enemymove(){
      var collection= document.getElementsByClassName("enemy")[0].children;
      //攻击结束释放下一波敌人
      if(collection.length<1){
            //限定为3波攻击
            if(当前第几波<3){
                当前第几波=(当前第几波+1);
                addenemy(当前第几波*6,_已经开始时间+预备时间,30);
                return;
            }else if(当前第几波==3){
                alert("恭喜你，游戏已通关!");
                window.location="index.html";
                是暂停中=true;
                return;
            }
      }
      //移动所有敌人
        for(var i=0;i<collection.length;i++){
            var enemyrow=parseInt ( collection[i].getAttribute("data-row"));
            var enemyleft=parseFloat( collection[i].getAttribute("data-left"));
            var enemyplaytime=collection[i].getAttribute("data-playtime");
            //如果有敌人到最左边
            if(enemyleft<0){
                    alert("游戏失败");
                    是暂停中=true;
                    return;
            }
            //判断一个敌人是否移动的标识
          var move=true;
          var armycollection= document.getElementsByClassName("army")[0].children;
            for(var j=0;j<armycollection.length;j++){
               var armyrow=parseInt( armycollection[j].getAttribute("data-row"));
               var armyleft=parseFloat( armycollection[j].getAttribute("data-left"));
               //如果一个军人被攻击
                if(armyleft>(enemyleft-5)&&enemyrow==armyrow&&enemyleft>=armyleft){
                    //敌人不移动
                    move=false;
                    //军人减血
                    var armybloodnum=parseInt( armycollection[j].getAttribute("data-bloodnum"))-1;
                    armycollection[j].setAttribute("data-bloodnum",armybloodnum);
                    break;
                }
            }
            //移动ing
            if(enemyplaytime<_已经开始时间&&move)
            {
                var left=parseFloat(String(collection[i].getAttribute("data-left")));
                left=left-0.05;
                collection[i].setAttribute("data-left",String(left));
                var main= document.getElementById("main").offsetWidth*left*0.01;
                collection[i].style.margin=("0 0 0 "+ main+"px");
            }
        }
}
//控制发射子弹
function sendbullet(row,left,top,attacknum){
    //
    var img=document.createElement("img");
    img.setAttribute("src","images/2.png");
    img.setAttribute("data-attacknum",attacknum);
    img.setAttribute("data-row",row);
    img.setAttribute("data-left",left+3);
    img.setAttribute("style","left:0;top:"+top+"%;width:5%;height:12%;");
    document.getElementsByClassName("bullet")[0].appendChild(img);
}
//控制移动子弹
function bulletmove(){
    var collection= document.getElementsByClassName("bullet")[0].children;
    //移动所有的子弹
    for(var i=0;i<collection.length;i++){
        var row=collection[i].getAttribute("data-row");//第几行
        var left=parseFloat(String(collection[i].getAttribute("data-left")));
        left=left+0.3;
        collection[i].setAttribute("data-left",String(left));
        var main= document.getElementById("main").offsetWidth*left*0.01;
        collection[i].style.margin=("0 0 0 "+ main+"px");
    }
    //计算击中并减去血量
    var enemycollection= document.getElementsByClassName("enemy")[0].children;
    for(var i=0;i<enemycollection.length;i++){
        var enemyleft=parseFloat(String(enemycollection[i].getAttribute("data-left")));
     
        var enemyrow=enemycollection[i].getAttribute("data-row");//第几行
        var collection= document.getElementsByClassName("bullet")[0].children;

        for(var j=0;j<collection.length;j++){
            var bulletleft=parseFloat(String(collection[j].getAttribute("data-left")));
            var bulletrow=collection[j].getAttribute("data-row");//第几行
            var bulletattcaknum=collection[j].getAttribute("data-attacknum");//第几行
            if(bulletleft>enemyleft&&enemyrow==bulletrow){
                //计算血量
                var bloodnum =parseInt(enemycollection[i].getAttribute("data-bloodnum"))-parseInt(bulletattcaknum);
                enemycollection[i].setAttribute("data-bloodnum",bloodnum);
                //消除子弹
                collection[j].remove();
                break;
            }
        }
    }
}
function deletenemy(){
    var enemycollection= document.getElementsByClassName("enemy")[0].children;
    for(var i=0;i<enemycollection.length;i++){
        var enemyleft=parseInt(String(enemycollection[i].getAttribute("data-bloodnum")));
        if(enemyleft<=0){
            enemycollection[i].remove();
        }
    }
}
function deletbullet(){
    var collection= document.getElementsByClassName("bullet")[0].children;
    for(var i=0;i<collection.length;i++){
        var bulletleft=parseFloat(String(collection[i].getAttribute("data-left")));
        if(bulletleft>100){
            collection[i].remove();
        }
    }
}
////////////////////////////////////////////////////////
function touchover(div){
    if(被选中军队的攻击力<1){
        return;
    }
    var main= document.getElementById("main").offsetWidth;
    var left=parseFloat(div.getAttribute("data-left"));
    var element=document.getElementById("remember");
    element.setAttribute("src",被选中军队的图片路径);
    element.style.margin="0 0 0 "+left*main*0.01+"px";
    element.style.top=div.style.top;
}
function resetarmytype(img,imgpath,attacknum,attackreadtime,bloodnum){
    被选中军队的图片路径=imgpath;
    被选中军队的攻击力=attacknum;
    被选中军队的攻击力预备时间=attackreadtime;
    被选中军队的血量=bloodnum;
    var list=document.getElementsByClassName("sss");
    for(var i=0;i<list.length;i++){
      
        list[i].style.background="transparent";
    }
    img.style.background="red";
}
function nosetarmytype(img){
    被选中军队的图片路径=null;
    被选中军队的攻击力=0;
    被选中军队的攻击力预备时间=100000000000000000;
    被选中军队的血量=0;
    var list=document.getElementsByClassName("sss");
    for(var i=0;i<list.length;i++){
        list[i].style.background="transparent";
    }
    img.style.background="red";
}
function insertarmy(div){
    var collection= document.getElementsByClassName("army")[0].children;
    var div_left= div.getAttribute("data-left");
    var div_top= div.getAttribute("data-top");
    var div_row= div.getAttribute("data-row");
    var div_col= div.getAttribute("data-col");
    for(var i=0;i<collection.length;i++){
        var left= collection[i].getAttribute("data-left");
        var top=  collection[i].getAttribute("data-top");
        var row=  collection[i].getAttribute("data-row");
        var col=  collection[i].getAttribute("data-col");
        if(div_row==row&&div_col==col){
            alert("不可以重复添加");
            return;
        }
    }
    if(金币数-被选中军队的攻击力<0){
        alert("金币不足");
        return;
    }else{
        金币数=金币数-被选中军队的攻击力;
        document.getElementById("money").innerText=金币数;
    }
    if(被选中军队的图片路径!=null&&被选中军队的攻击力>0){
       var left= div.getAttribute("data-left");
       var top= div.getAttribute("data-top");
       var row= div.getAttribute("data-row");
       var col= div.getAttribute("data-col");

       var img=document.createElement("img");
       img.setAttribute("src",被选中军队的图片路径);
       img.setAttribute("data-attacknum",被选中军队的攻击力);
       img.setAttribute("data-row",row);
       img.setAttribute("data-left",left);
       img.setAttribute("data-col",col);
       img.setAttribute("data-top",top);
       img.setAttribute("data-bloodnum",被选中军队的血量);
       img.setAttribute("data-readytime",被选中军队的攻击力预备时间);
       img.setAttribute("data-attackreadytime",0);
       img.style.left=left+"%";
       img.style.top=top+"%";
       document.getElementsByClassName("army")[0].appendChild(img);
    }
}



///////////////////////////////////////////////////
function attack(){
    var collection= document.getElementsByClassName("army")[0].children;
    for(var i=0;i<collection.length;i++){
        var attackreadytime=parseInt(collection[i].getAttribute("data-attackreadytime"));
        var readytime=parseInt(collection[i].getAttribute("data-readytime"));//固有属性
        var row=parseInt(collection[i].getAttribute("data-row"));
        var top=parseInt(collection[i].getAttribute("data-top"));
        var left=parseInt(collection[i].getAttribute("data-left"));
        var attacknum=parseInt(collection[i].getAttribute("data-attacknum"));
        if(attackreadytime<0){
            sendbullet(row,left,top,attacknum);
            collection[i].setAttribute("data-attackreadytime",readytime);
        }else{
            collection[i].setAttribute("data-attackreadytime",attackreadytime-1);
        }
    }
}
function deletearmy(){
    var armycollection= document.getElementsByClassName("army")[0].children;
    for(var i=0;i<armycollection.length;i++){
        var bloodnum=parseInt( armycollection[i].getAttribute("data-bloodnum"));
        if(bloodnum<0){
            armycollection[i].remove();
        }
    }
}
//设置游戏进度条
function setprocess(){
    if(当前第几波==1){
        var armycollection= document.getElementById("processbar").style.width="70%";
    }else if(当前第几波==2){
        var armycollection= document.getElementById("processbar").style.width="30%";
    }else if(当前第几波==3){
        var armycollection= document.getElementById("processbar").style.width="0%";
    }
}



