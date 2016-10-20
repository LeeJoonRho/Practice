<div class="infopop" title="정보수정">
<form action="<?php echo SITE_ROOT;?>/app/pages/info.php" method="post" class="form-horizontal">
	<div class="form-group">
		<label for="username" class="col-sm-2 control-label">이름</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="username" id="username" placeholder="이름을 입력하세요." required>
		</div>
	</div>
	<div class="form-group">
		<label for="useremail" class="col-sm-2 control-label">Email</label>
		<div class="col-sm-10">
			<input type="email" class="form-control" name="useremail" id="useremail" placeholder="your@email.com" required>
		</div>
	</div>
	<div class="form-group">
		<label for="userpass" class="col-sm-2 control-label">password</label>
		<div class="col-sm-10">
			<input type="password" class="form-control" name="userpass" id="userpass" required>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-info col-sm-12">수정하기</button>
		</div>
	</div>
</form>
</div>