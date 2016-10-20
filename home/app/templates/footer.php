<hr>
<footer>
        <p>&copy; Company 2015</p>
      </footer>
    </div> <!-- /container -->
    <?php
    	if(!$member['userlogin']) {
    		require(PAGES . "signupform.php");
    	}
    ?>
    <?php
    	if($member['userlogin']) {
    		require(PAGES . "infoform.php");
    	}
    ?>
    <script src="<?php echo JS;?>vendor/jquery-1.11.2.min.js"></script>
    <script src="<?php echo JS;?>vendor/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
    <script src="<?php echo JS;?>main.js"></script>
    </body>
</html>
