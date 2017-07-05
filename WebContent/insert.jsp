<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
			<meta charset="utf-8"> 
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
			  
			  
			   
				<link href="assets/css/bootstrap.css" rel="stylesheet" />
			     <!-- FONTAWESOME STYLE CSS -->
			    <link href="assets/css/font-awesome.css" rel="stylesheet" />
			    <!-- CUSTOM STYLE CSS -->
			    <link href="assets/css/style.css" rel="stylesheet" />
				<!--     	自定义css -->
			    <link href="assets/css/MyCss.css" rel="stylesheet" />
				<script src="assets/js/jquery-1.11.1.js"></script>
			    <!-- BOOTSTRAP SCRIPTS  -->
			    <script src="assets/js/bootstrap.js"></script>
			    <!-- CUSTOM SCRIPTS  -->
			    <script src="assets/js/custom.js"></script>
			    
			<script src="assets/js/user.js"></script>
			
			<title>新增数据</title>

																				<!-- 			数据库源 -->
		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     		url="jdbc:mysql://localhost:3306/NSI_DATABASE"
    	 	user="root"  password="123456"/>
</head>

	<style>
		body{background-color:#c7d0d5}
	</style>
	<!-- 	顶栏滚动透明 -->
	<style type="text/css">  
	        html, body {width:100%;height:100%;} /*非常重要的样式让背景图片100%适应整个屏幕*/  
	        .bg {display: table;width: 100%;height: 100%;padding: 100px 0;text-align: center;color: #fff;background: url(http://www.xiandanke.cn/Image/intro-bg.jpg) no-repeat bottom center;background-color: #000;background-size: cover;}  
	        .my-navbar {padding:20px 0;transition: background 0.5s ease-in-out, padding 0.5s ease-in-out;}  
	        .my-navbar a{background:transparent !important;color:#fff !important}  
	        .my-navbar a:hover {color:#45bcf9 !important;background:transparent;outline:0}  
	        .my-navbar a {transition: color 0.5s ease-in-out;}/*-webkit-transition ;-moz-transition*/  
	        .top-nav {padding:0;background:#455a64;}  
	        button.navbar-toggle {background-color:#fbfbfb;}/*整个背景都是transparent透明的，会看不到，所以再次覆盖一下*/  
	        button.navbar-toggle > span.icon-bar {background-color:#dedede}  
	 </style>


<script type="text/javascript">
	    //移动光标到最后
	 
	function checkUserid(){  
	    var ueridObj=document.getElementById("userid");  
	    var userid=ueridObj.value;  
	    var msg ="   <img src='assets/img/true.jpg' style='width:27px'>";  
	    if(!userid)  
	        msg ="<font color='red'><h5>名称不能为空！</h5></font>";  
	    var span = document.getElementById("useridSpan");  
	    span.innerHTML = msg;  
	    return msg == "   <img src='assets/img/true.jpg' style='width:27px'>";  
	    }  
	function trim(s){  
	   	return s.replace(/^\s+|\s+$/g,"");  
		}  

// 	亩米转换
	function Mu2Meter(){  
	    var Mu=document.getElementById("Mu2MeterID");  
	    var Mu=Mu.value;  
	    var Meter=Mu*666;
	    var MeterInner = document.getElementById("Meter2MuID");  
	    MeterInner.value = Meter;  
	    }  
	function Meter2Mu(){  
	    var Meter=document.getElementById("Meter2MuID");  
	    var Meter=Meter.value;  
	    var Mu=parseInt(Meter/666);
	    var MuInner = document.getElementById("Mu2MeterID");  
	    MuInner.value = Mu;  
	    }  
</script>

<!-- 省市联动 -->
<script type="text/javascript">

		//定义数组，存储省份信息 
		var province = ["北京", "上海", "天津", "重庆", "浙江", "江苏", "广东", "福建", "湖南", "湖北", "辽宁", 
		"吉林", "黑龙江", "河北", "河南", "山东", "陕西", "甘肃", "新疆", "青海", "山西", "四川", 
		"贵州", "安徽", "江西", "云南", "内蒙古", "西藏", "广西", "宁夏", "海南", "香港", "澳门", "台湾"]; 
		
		//定义数组,存储城市信息 
		var beijing = ["","东城区", "西城区", "海淀区", "朝阳区", "丰台区", "石景山区", "通州区", "顺义区", "房山区", "大兴区", "昌平区", "怀柔区", "平谷区", "门头沟区", "延庆县", "密云县"]; 
		var shanghai = ["","浦东新区", "徐汇区", "长宁区", "普陀区", "闸北区", "虹口区", "杨浦区", "黄浦区", "卢湾区", "静安区", "宝山区", "闵行区", "嘉定区", "金山区", "松江区", "青浦区", "南汇区", "奉贤区", "崇明县"]; 
		var tianjing = ["","河东", "南开", "河西", "河北", "和平", "红桥", "东丽", "津南", "西青", "北辰", "塘沽", "汉沽", "大港", "蓟县", "宝坻", "宁河", "静海", "武清"]; 
		var chongqing = ["","渝中区", "大渡口区", "江北区", "沙坪坝区", "九龙坡区", "南岸区", "北碚区", "万盛区", "双桥区", "渝北区", "巴南区", "万州区", "涪陵区", "黔江区", "长寿区", "江津区", "合川区", "永川区", "南川区"]; 
		var jiangsu = ["","南京", "无锡", "常州", "徐州", "苏州", "南通", "连云港", "淮安", "扬州", "盐城", "镇江", "泰州", "宿迁"]; 
		var zhejiang = ["","杭州", "宁波", "温州", "嘉兴", "湖州", "绍兴", "金华", "衢州", "舟山", "台州", "利水","诸暨"]; 
		var guangdong = ["","广州", "韶关", "深圳", "珠海", "汕头", "佛山", "江门", "湛江", "茂名", "肇庆", "惠州", "梅州", "汕尾", "河源", "阳江", "清远", "东莞", "中山", "潮州", "揭阳"]; 
		var fujiang = ["","福州", "厦门", "莆田", "三明", "泉州", "漳州", "南平", "龙岩", "宁德"]; 
		var hunan = ["","长沙", "株洲", "湘潭", "衡阳", "邵阳", "岳阳", "常德", "张家界", "益阳", "郴州", "永州", "怀化", "娄底", "湘西土家苗族自治区"]; 
		var hubei = ["","武汉", "襄阳", "黄石", "十堰", "宜昌", "鄂州", "荆门", "孝感", "荆州", "黄冈", "咸宁", "随州", "恩施土家族苗族自治州"]; 
		var liaoning = ["","沈阳", "大连", "鞍山", "抚顺", "本溪", "丹东", "锦州", "营口", "阜新", "辽阳", "盘锦", "铁岭", "朝阳", "葫芦岛"]; 
		var jilin = ["","长春", "吉林", "四平", "辽源", "通化", "白山", "松原", "白城", "延边朝鲜族自治区"]; 
		var heilongjiang = ["","哈尔滨", "齐齐哈尔", "鸡西", "牡丹江", "佳木斯", "大庆", "伊春", "黑河", "大兴安岭"]; 
		var hebei = ["","石家庄", "保定", "唐山", "邯郸", "承德", "廊坊", "衡水", "秦皇岛", "张家口"]; 
		var henan = ["","郑州", "洛阳", "商丘", "安阳", "南阳", "开封", "平顶山", "焦作", "新乡", "鹤壁", "许昌", "漯河", "三门峡", "信阳", "周口", "驻马店", "济源"]; 
		var shandong = ["","济南", "青岛", "菏泽", "淄博", "枣庄", "东营", "烟台", "潍坊", "济宁", "泰安", "威海", "日照", "滨州", "德州", "聊城", "临沂"]; 
		var shangxi = ["","西安", "宝鸡", "咸阳", "渭南", "铜川", "延安", "榆林", "汉中", "安康", "商洛"]; 
		var gansu = ["","兰州", "嘉峪关", "金昌", "金川", "白银", "天水", "武威", "张掖", "酒泉", "平凉", "庆阳", "定西", "陇南", "临夏", "合作"]; 
		var qinghai = ["","西宁", "海东地区", "海北藏族自治州", "黄南藏族自治州", "海南藏族自治州", "果洛藏族自治州", "玉树藏族自治州", "海西蒙古族藏族自治州"]; 
		var xinjiang = ["","乌鲁木齐", "奎屯", "石河子", "昌吉", "吐鲁番", "库尔勒", "阿克苏", "喀什", "伊宁", "克拉玛依", "塔城", "哈密", "和田", "阿勒泰", "阿图什", "博乐"]; 
		var shanxi = ["","太原", "大同", "阳泉", "长治", "晋城", "朔州", "晋中", "运城", "忻州", "临汾", "吕梁"]; 
		var sichuan = ["","成都", "自贡", "攀枝花", "泸州", "德阳", "绵阳", "广元", "遂宁", "内江", "乐山", "南充", "眉山", "宜宾", "广安", "达州", "雅安", "巴中", "资阳", "阿坝藏族羌族自治州", "甘孜藏族自治州", "凉山彝族自治州"]; 
		var guizhou = ["","贵阳", "六盘水", "遵义", "安顺", "黔南布依族苗族自治州", "黔西南布依族苗族自治州", "黔东南苗族侗族自治州", "铜仁", "毕节"]; 
		var anhui = ["","合肥", "芜湖", "安庆", "马鞍山", "阜阳", "六安", "滁州", "宿州", "蚌埠", "巢湖", "淮南", "宣城", "亳州", "淮北", "铜陵", "黄山", "池州"]; 
		var jiangxi = ["","南昌", "九江", "景德镇", "萍乡", "新余", "鹰潭", "赣州", "宜春", "上饶", "吉安", "抚州"]; 
		var yunnan = ["","昆明", "曲靖", "玉溪", "保山", "昭通", "丽江", "普洱", "临沧", "楚雄彝族自治州", "大理白族自治州", "红河哈尼族彝族自治州", "文山壮族苗族自治州", "西双版纳傣族自治州", "德宏傣族景颇族自治州", "怒江傈僳族自治州", "迪庆藏族自治州"]; 
		var neimenggu = ["","呼和浩特", "包头", "乌海", "赤峰", "通辽", "鄂尔多斯", "呼伦贝尔", "巴彦淖尔", "乌兰察布"]; 
		var guangxi = ["","南宁", "柳州", "桂林", "梧州", "北海", "防城港", "钦州", "贵港", "玉林", "百色", "贺州", "河池", "崇左"]; 
		var xizang = ["","拉萨", "昌都地区", "林芝地区", "山南地区", "日喀则地区", "那曲地区", "阿里地区"]; 
		var ningxia = ["","银川", "石嘴山", "吴忠", "固原", "中卫"]; 
		var hainan = ["","海口", "三亚"]; 
		var xianggang = ["","中西区", "湾仔区", "东区", "南区", "九龙城区", "油尖旺区", "观塘区", "黄大仙区", "深水埗区", "北区", "大埔区", "沙田区", "西贡区", "元朗区", "屯门区", "荃湾区", "葵青区", "离岛区"]; 
		var taiwan = ["","台北", "高雄", "基隆", "台中", "台南", "新竹", "嘉义"]; 
		var aomeng = ["","澳门半岛", "氹仔岛", "路环岛"]; 
		
		//页面加载方法 
		$(function () { 
		//设置省份数据 
		setProvince(); 
		
		//设置背景颜色 
		setBgColor(); 
		}); 
		
		
		//设置省份数据 
		function setProvince() { 
		//给省份下拉列表赋值 
		var option, modelVal; 
		var $sel = $("#selProvince"); 
		
		//获取对应省份城市 
		for (var i = 0, len = province.length; i < len; i++) { 
		modelVal = province[i]; 
		option = "<option value='" + modelVal + "'>" + modelVal + "</option>"; 
		
		//添加到 select 元素中 
		$sel.append(option); 
		} 
		
		//调用change事件，初始城市信息 
		provinceChange(); 
		} 
		
		
		//根据选中的省份获取对应的城市 
		function setCity(provinec) { 
		var $city = $("#selCity"); 
		var proCity, option, modelVal; 
		
		//通过省份名称，获取省份对应城市的数组名 
		switch (provinec) { 
		case "北京": 
		proCity = beijing; 
		break; 
		case "上海": 
		proCity = shanghai; 
		break; 
		case "天津": 
		proCity = tianjing; 
		break; 
		case "重庆": 
		proCity = chongqing; 
		break; 
		case "浙江": 
		proCity = zhejiang; 
		break; 
		case "江苏": 
		proCity = jiangsu; 
		break; 
		case "广东": 
		proCity = guangdong; 
		break; 
		case "福建": 
		proCity = fujiang; 
		break; 
		case "湖南": 
		proCity = hunan; 
		break; 
		case "湖北": 
		proCity = hubei; 
		break; 
		case "辽宁": 
		proCity = liaoning; 
		break; 
		case "吉林": 
		proCity = jilin; 
		break; 
		case "黑龙江": 
		proCity = heilongjiang; 
		break; 
		case "河北": 
		proCity = hebei; 
		break; 
		case "河南": 
		proCity = henan; 
		break; 
		case "山东": 
		proCity = shandong; 
		break; 
		case "陕西": 
		proCity = shangxi; 
		break; 
		case "甘肃": 
		proCity = gansu; 
		break; 
		case "新疆": 
		proCity = xinjiang; 
		break; 
		case "青海": 
		proCity = qinghai; 
		break; 
		case "山西": 
		proCity = shanxi; 
		break; 
		case "四川": 
		proCity = sichuan; 
		break; 
		case "贵州": 
		proCity = guizhou; 
		break; 
		case "安徽": 
		proCity = anhui; 
		break; 
		case "江西": 
		proCity = jiangxi; 
		break; 
		case "云南": 
		proCity = yunnan; 
		break; 
		case "内蒙古": 
		proCity = neimenggu; 
		break; 
		case "西藏": 
		proCity = xizang; 
		break; 
		case "广西": 
		proCity = guangxi; 
		break; 
		case "": 
		proCity = xizang; 
		break; 
		case "宁夏": 
		proCity = ningxia; 
		break; 
		case "海南": 
		proCity = hainan; 
		break; 
		case "香港": 
		proCity = xianggang; 
		break; 
		case "澳门": 
		proCity = aomeng; 
		break; 
		case "台湾": 
		proCity = taiwan; 
		break; 
		} 
		
		//先清空之前绑定的值 
		$city.empty(); 
		
		//设置对应省份的城市 
		for (var i = 0, len = proCity.length; i < len; i++) { 
		modelVal = proCity[i]; 
		option = "<option value='" + modelVal + "'>" + modelVal + "</option>"; 
		
		//添加 
		$city.append(option); 
		} 
		
		//设置背景 
		setBgColor(); 
		} 
		
		
		//省份选中事件 
		function provinceChange() { 
		var $pro = $("#selProvince"); 
		setCity($pro.val()); 
		} 
		
		
		//设置下拉列表间隔背景样色 
		function setBgColor() { 
		var $option = $("select option:odd"); 
		$option.css({ "background-color": "#DEDEDE" }); 
		} 
			
			
</script>


<body > 
    <!-- 		顶栏 -->
		<nav class="navbar navbar-fixed-top my-navbar" role="navigation">  
	        <div class="container-fluid">  
	            <div class="navbar-header l-h-001">  
	                <button type="button" class="navbar-toggle" data-toggle="collapse" 
	                 data-target="#example-navbar-collapse"> 
	                   	<span class="icon-bar"></span> 
                     	<span class="icon-bar"></span> 
                  	 	<span class="icon-bar"></span> 
	                </button>  
	                <a class="navbar-brand l-f24" href="#"><strong>新学说</strong></a>  
	            </div>  
	            <div class="collapse navbar-collapse l-f20" id="example-navbar-collapse">  
	                <ul class="nav navbar-nav navbar-right l-h-002">  
		                <li><a href="/nsi-0.8/list.jsp"><b>学校</b></a></li>
	                    <li><a href="/nsi-0.8/institution/Institution_list.jsp"><b>机构</b></a></li>
	                   	<li><a href="/nsi-0.8/people/People_list.jsp"><b>人员</b></a></li>
	                    <li><a href="/nsi-0.8/about.jsp"><b>关于</b></a></li>
	                    <li><a href="/nsi-0.8/login.jsp" class="active-menu-item"><b>登录</b></a></li>
		                <li></li>
	                </ul>  
	            </div>  
	        </div>  
	    </nav> 

	    
		<script>  
		        $(window).scroll(function () {  
		            if ($(".navbar").offset().top > 50) {$(".navbar-fixed-top").addClass("top-nav");  
		            }else {$(".navbar-fixed-top").removeClass("top-nav");}  
		        })
	    </script> 
	
	<br><br><br><br>

    <!--HOME SECTION END-->
    <section>
       <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		
			<div class="jumbotron">
				<h1>
					新增数据
				</h1>
				<p>
					请按照标准格式录入数据
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="list.jsp">返回查询页面</a>
				</p>
			</div>
		
			<form class="form-horizontal" role="form" action="list.jsp" name="myform" method="post">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">学校名</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="userid" onblur="checkUserid()" name="School_name" />
					</div>
					<div class="col-sm-5"> <span id="useridSpan" style=" color:#999"><h5>请输入学校名称</h5></span>  </div>
					
					
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">学校性质</label>
					<div class="col-sm-5">
					
<!-- 						<input type="text" class="form-control" id="inputEmail3" name="School_properties"/> -->						
							<select class="form-control" name="School_properties">
								<option value="公办">公办</option>
								<option value="民办">民办</option>
								<option value="外籍">外籍</option>
								<option value="私立">私立</option>
								<option value="其他">其他</option>
							</select>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">成立时间</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id_Founded_time" name="Founded_time"/>
					</div>
				</div>
				
<!-- 				联动省市选择 -->
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">所在地区</label>
					<div class="col-sm-2">			
						<select class="form-control" id="selProvince" name="Areas01"onchange="provinceChange();"></select> 		
					</div>
					<div class="col-sm-3">
						<select class="form-control" id="selCity" name="Areas02"></select> 
					</div>
				</div>
				
				<div>	
	                <div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">学制</label>
						<div class="col-sm-5">
	 						<input type="text" class="form-control" id="id_School_system" name="School_system"/>
						</div>
						<div class="col-sm-5"> <span id="useridSpan" style=" color:#999"><h5>注意：以分号结尾</h5></span>  </div>
					</div>
					<div class="form-group">   
						<label for="inputEmail3" class="col-sm-2 control-label"></label>
		                 <div >
							<div class="col-sm-5">
	                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert02('高中;')" value="高中" />
	                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert02('初中;')" value="初中" />
	                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert02('小学;')" value="小学" />
	                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert02('幼儿园;')" value="幼儿园" />
							</div>
		                  </div>
					</div>	
				</div>	
                <div> 
                    <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">课程</label>
						<div class="col-sm-5">
							<input type="text" class="col-sm-4 form-control" id="id_Course" name="Course"/>
						</div >
						<div class="col-sm-5"> 
							<span id="useridSpan" style=" color:#999"><h5>注意：以分号结尾</h5></span>  
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label"></label>
						<div class="col-sm-5">
							 <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IPC;')" value="IPC" />
                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IMYC;')" value="IMYC" />
                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('AP;')" value="AP" />
                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IB;')" value="IB" />
                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IBPYP;')" value="IBPYP" />
                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IBMYP;')" value="IBMYP" />
                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IBDP;')" value="IBDP" />
                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('A-LEVEL;')" value="A-LEVEL" />
                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IGCSE;')" value="IGCSE" />
                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('蒙特梭利;')" value="蒙特梭利" />
                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('美国课程;')" value="美国课程" />
                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('加拿大课程;')" value="加拿大课程" />
                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('澳洲课程;')" value="澳洲课程" />                            
						</div>						
					</div>				
				</div>		          	
                    <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">校长</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id_President" name="President"/>
					</div>
				</div>	
                   <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">校长国籍</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id_President_country" name="President_country"/>
					</div>
				</div>	
                    <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">教师数量</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id_Teacher_number" name="Teacher_number"/>
					</div>
				</div>		
                 <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">外籍教师数量</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id_Foreign_teacher_num" name="Foreign_teacher_num"/>
					</div>
				</div>	
                    <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">教师薪酬</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id_Teacher_salary" name="Teacher_salary"/>
					</div>
					<div class="col-sm-5"> <span id="useridSpan" style=" color:#999"><h5>例如：20000-30000 或 30000</h5></span>  </div>
				</div>		
                <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">在校生数量</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id_Num_students" name="Num_students"/>
					</div>
				</div>		
                	<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">毕业班人数</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id_Graduating_stu_num" name="Graduating_stu_num"/>
					</div>
				</div>		
				<!-- 				课外教学比例 -->
	             <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">俱乐部数量</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id_Extra_curricular_edu" name="Extra_curricular_edu"/>
					</div>
				</div>		
                   <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">占地面积（亩）</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id_Covered_area" name="Covered_area"/>
					</div>
					
			
					<div class="col-sm-5" style="border:1px solid #888;padding:0;">
						<span id="useridSpan"  class="col-sm-3" style="color:#777"><h5>亩/米计算器</h5></span>		
						 <input type="text" style="border-radius: 4px;" class="col-sm-3" id="Mu2MeterID" onblur="Mu2Meter()"placeholder="亩"/> 	
						 <span id="useridSpan"  class="col-sm-1" style="color:#888"><h5>亩</h5></span>			
						 <input type="text" style="border-radius: 4px;" class="col-sm-3" id="Meter2MuID" onblur="Meter2Mu()"placeholder="平方米"/>
						 <span id="useridSpan"  class="col-sm-2" style="color:#888"><h5>平方米</h5></span>
					</div>
				</div>	
                <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">建筑面积（平方米）</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id_Built_area" name="Built_area"/>
					</div>
				</div>		
                    <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">学费</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id_Tuition" name="Tuition"/>
					</div>
					<div class="col-sm-5"> <span id="useridSpan" style=" color:#999"><h5>例如：80000-120000 或 90000</h5></span>  </div>
				</div>
				
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">网站</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id_website" name="website"/>
					</div>
					<div class="col-sm-5"> <span id="useridSpan" style=" color:#999"><h5>例如：www.baidu.com</h5></span>  </div>
				</div>
				
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">投资信息</label>
					<div class="col-sm-5">
<!-- 						<input type="text" class="form-control" id="id_Investment" name="Investment"/> -->
						<textarea class="form-control" id="id_Investment" name="Investment" rows="3"></textarea>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">备注</label>
					<div class="col-sm-5">
<!-- 						<input type="text" class="form-control" id="id_remark" name="remark"/> -->
						<textarea class="form-control" id="id_remark" name="remark" rows="3"></textarea>
					</div>
				</div>	

             	<br>		
                <div class="form-group">
					<div class="col-sm-offset-6 col-sm-10">
						<input type="hidden" name="whereFrom" value="insert">
						<button onclick="NulltoZero()" type="submit" class="btn btn-primary">提交</button>
					</div>
				</div>
			</form>
		
		
		</div>
	</div>
</div>
    </section>
    
   
    
	<!--     导入底栏jsp文件 -->
	<div><jsp:include page="modular/bottomBar.jsp"/>
	</div>
     <!-- COPY TEXT SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
    
</body>
</html>
																										

	
