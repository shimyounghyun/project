function agree(idx,name,id,team,obj){
	var tr = $(obj).parent().parent();
	$.ajax({
		type:"post",
		url: "/sport/team/teamAgree",
		data: "team="+team+"&useridx="+idx+"&username="+name+"&userid="+id,
		success: function(data){
			tr.remove();
		}
	});
}

function refuse(idx,name,id,team,obj){
	var tr = $(obj).parent().parent();
	$.ajax({
		type:"post",
		url: "/sport/team/teamRefuse",
		data: "team="+team+"&useridx="+idx+"&username="+name+"&userid="+id,
		success: function(data){
			tr.remove();
		}
	});
}