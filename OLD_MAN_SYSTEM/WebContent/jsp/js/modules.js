$( function() {

	function toLimitit( tag ) {

		$.ajax( {
			type: "POST",
			url: "modules/toTargetModulesPage",
			ansyc: false,
			data: {
				Page: tag
			},
			dataType: "json",
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			success: function( data ) {
				$( "#tbody" ).html( "" );// 清空原来的表格，重新生成表格
				// alert(data.list.length);
				for ( var i = 0; i < data.list.length; i++ ) {
					$( "#tbody" ).append( '<tr style=text-align:center id=' + i + '>' );
					$( "#" + i ).append( '<td>' + data.list[i].id + '</td>' );
					$( "#" + i ).append( '<td>' + data.list[i].serviceModuleIsbn + '</td>' );
					$( "#" + i ).append( '<td>' + data.list[i].serviceModuleName + '</td>' );
					$( "#" + i ).append( '<td>' + data.list[i].accessCount + '</td>' );
					$( "#" + i ).append(
							'<td><a href=pf/toModPage?professionalId=' +
									data.list[i].serviceModuleIsbn +
									' ><font color=red>编辑</font></a></td></tr>' );

				}
			}
		} );
	}
	$( "#sel" ).on( 'click', function() {
		var professionalId = $( "#professionalId" ).val();
		alert( "客户信息" + professionalId );
		$.ajax( {
			type: "POST",
			ansyc: false,
			url: "pf/getSignalProfessionalByIsbn",
			data: {
				professionalId: professionalId
			},
			dataType: "json",
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			success: function( data ) {
				var info = "专业代码:" + data.professional.professionalId + "<br>";
				info = info + "专业名:" + data.professional.professionalName + "<br>";
				info = info + "高校名:" + data.professional.school.schoolName + "<br>";
				info = info + "学制:" + data.professional.studyRule + "年/制<br>";
				info = info + "授予学位:" + data.professional.anbandon + "<br>";
				info = info + "招生方式:" + data.professional.enrolmentWay + "<br>";
				info = info + "招生类型:" + data.professional.enrolmentType + "<br>";
				info = info + "审核状态:" + data.professional.status + "<br>";
				layer.open( {
					type: 0,
					shade: false,
					title: false, // 不显示标题
					content: info
				// 捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
				} );
			}
		} );
	} );
} );

function toLimitit( tag ) {
	$.ajax( {
		type: "POST",
		url: "modules/toTargetModulesPage",
		ansyc: false,
		data: {
			Page: tag,
			schoolId: $( "#schoolId" ).val(),
			status: $( "#status" ).val()
		},
		dataType: "json",
		contentType: "application/x-www-form-urlencoded;charset=utf-8",
		success: function( data ) {
			$( "#tbody" ).html( "" );// 清空原来的表格，重新生成表格
			// alert(data.list.length);
			for ( var i = 0; i < data.list.length; i++ ) {
				$( "#tbody" ).append( '<tr style=text-align:center id=' + i + '>' );
				$( "#" + i ).append( '<td>' + data.list[i].id + '</td>' );
				$( "#" + i ).append( '<td>' + data.list[i].serviceModuleIsbn + '</td>' );
				$( "#" + i ).append( '<td>' + data.list[i].serviceModuleName + '</td>' );
				$( "#" + i ).append( '<td>' + data.list[i].accessCount + '/次</td>' );
				$( "#" + i ).append(
						'<td><a href=pf/toModPage?professionalId=' + data.list[i].professionalId +
								' ><font color=red>编辑</font></a></td></tr>' );

			}
		}
	} );
}
function del( tag ) {
	var professionalId = tag.id;
	layer.confirm( '是否删除该条信息？', {
		btn: [
				'是', '否'
		]
	// 按钮
	}, function() {
		$.ajax( {
			type: "POST",
			url: "pf/delPFByIsbn",
			data: {
				professionalId: professionalId
			},
			dataType: "json",
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			success: function( data ) {
				if ( data.flag ) {
					layer.msg( '删除成功！', {
						icon: 1
					} );
					setTimeout( function() {
						toLimitit( 1 );
					}, 2000 );

				} else {
					layer.msg( '删除失败!' );
				}
			}
		} );

	} );

}