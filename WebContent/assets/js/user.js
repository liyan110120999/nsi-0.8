//本业为自定义的js
//关联：insert、 alter两个页面

var setPos=function(o){
        if(o.setSelectionRange){//W3C
            setTimeout(function(){
                o.setSelectionRange(o.value.length,o.value.length);
                o.focus();
            },0);
        }else if(o.createTextRange){//IE
            var textRange=o.createTextRange();
            textRange.moveStart("character",o.value.length);
            textRange.moveEnd("character",0);
            textRange.select();
        }
    };
    
    //课程点击按钮输入
function Insert(str) { 
	var obj = document.getElementById('id_Course'); 
	setPos(obj);
	if(document.selection) { 
	obj.focus(); 
	var sel=document.selection.createRange(); 
	document.selection.empty(); 
	sel.text = str; 
	} else { 
	var prefix, main, suffix; 
	prefix = obj.value.substring(0, obj.selectionStart); 
	main = obj.value.substring(obj.selectionStart, obj.selectionEnd); 
	suffix = obj.value.substring(obj.selectionEnd); 
	obj.value = prefix + str + suffix; 
	} 
	obj.focus(); 
	}         
	//学制点击按钮输入
function Insert02(str) { 
	var obj = document.getElementById('id_School_system'); 
	setPos(obj);
	if(document.selection) { 
	obj.focus(); 
	var sel=document.selection.createRange(); 
	document.selection.empty(); 
	sel.text = str; 
	} else { 
	var prefix, main, suffix; 
	prefix = obj.value.substring(0, obj.selectionStart); 
	main = obj.value.substring(obj.selectionStart, obj.selectionEnd); 
	suffix = obj.value.substring(obj.selectionEnd); 
	obj.value = prefix + str + suffix; 
	} 
	obj.focus(); 
}  

	//为填入数据时自动补0
function NulltoZero(){

		if(document.getElementById("id_Founded_time").value==""){			
 			document.getElementById("id_Founded_time").value="0";
		}
		if(document.getElementById("id_School_system").value==""){			
 			document.getElementById("id_School_system").value="0";
		}
		if(document.getElementById("id_Course").value==""){			
 			document.getElementById("id_Course").value="0";
		}
		if(document.getElementById("id_President").value==""){			
 			document.getElementById("id_President").value="0";
		}
		if(document.getElementById("id_President_country").value==""){			
 			document.getElementById("id_President_country").value="0";
		}
		if(document.getElementById("id_Teacher_number").value==""){			
 			document.getElementById("id_Teacher_number").value="0";
		}
		if(document.getElementById("id_Foreign_teacher_num").value==""){			
 			document.getElementById("id_Foreign_teacher_num").value="0";
		}
		if(document.getElementById("id_Teacher_salary").value==""){			
 			document.getElementById("id_Teacher_salary").value="0";
		}
		if(document.getElementById("id_Num_students").value==""){			
 			document.getElementById("id_Num_students").value="0";
		}
		if(document.getElementById("id_Graduating_stu_num").value==""){			
 			document.getElementById("id_Graduating_stu_num").value="0";
		}
		if(document.getElementById("id_Extra_curricular_edu").value==""){			
 			document.getElementById("id_Extra_curricular_edu").value="0";
		}
		if(document.getElementById("id_Covered_area").value==""){			
 			document.getElementById("id_Covered_area").value="0";
		}
		if(document.getElementById("id_Built_area").value==""){			
 			document.getElementById("id_Built_area").value="0";
		}
		if(document.getElementById("id_Tuition").value==""){			
 			document.getElementById("id_Tuition").value="0";
		}
			
	}


////////////////////////////////////////////////////////////////// 人员 模块 ////////////////////////////////////

	//	会员类型 选项输入，， 服务于:People_alter
function Insert03(str) { 
	var obj = document.getElementById('People_member_id'); 
	setPos(obj);
	if(document.selection) { 
	obj.focus(); 
	var sel=document.selection.createRange(); 
	document.selection.empty(); 
	sel.text = str; 
	} else { 
	var prefix, main, suffix; 
	prefix = obj.value.substring(0, obj.selectionStart); 
	main = obj.value.substring(obj.selectionStart, obj.selectionEnd); 
	suffix = obj.value.substring(obj.selectionEnd); 
	obj.value = prefix + str + suffix; 
	} 
	obj.focus(); 
} 
	//职位类型 选项输入，， 服务于:People_alter
function Insert04(str) { 
	var obj = document.getElementById('People_position_id'); 
	setPos(obj);
	if(document.selection) { 
	obj.focus(); 
	var sel=document.selection.createRange(); 
	document.selection.empty(); 
	sel.text = str; 
	} else { 
	var prefix, main, suffix; 
	prefix = obj.value.substring(0, obj.selectionStart); 
	main = obj.value.substring(obj.selectionStart, obj.selectionEnd); 
	suffix = obj.value.substring(obj.selectionEnd); 
	obj.value = prefix + str + suffix; 
	} 
	obj.focus(); 
	} 

