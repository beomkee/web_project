function reset() {
	$('#mf_num').val('');
	$('#f_num').val('');
	$('#pl_num').val('');
	$('#e_id').val('');
	$('#p_num').val('');
	$('#mf_count').val('');
	$('#mf_date').val('');
}

function search() {
	setData();
}

function insertUpdate() {
	setData();
	if (!isFilled()) {
		alert("입력란을 모두 채워주세요");
	} else {

	}
}

function setData() {
	mf_num = $('#mf_num').val();
	f_num = $('#f_num option:selected').val();
	pl_num = $('#pl_num option:selected').val();
	e_id = $('#e_id option:selected').val();
	p_num = $('#p_num').val();
	mf_count = $('#mf_count').val();
	mf_date = $('#mf_date').val();
}
function isFilled() {
	setData();
	if (mf_num == null || f_num == null || pl_num == null || e_id == null
			|| p_num == null || mf_count == null || mf_date == null
			|| mf_num == "" || f_num == "" || pl_num == "" || e_id == ""
			|| p_num == "" || mf_count == "" || mf_date == "") {
		return false;
	} else {
		return true;
	}
}