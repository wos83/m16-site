<?php
	require_once('phpmailer/class.phpmailer.php');
	$mail = new PHPMailer();
	if(isset($_POST['name']) && isset($_POST['lname']) && isset($_POST['email']) && isset($_POST['message']) ) {
		// Please enter your email and name
		$to_email = '';		
		$to_name = '';
		$sender_name = $_POST['name'] . " ". $_POST['lname'];
		$from_mail = $_POST['email'];	
		$sender_message = $_POST['message'];
		
		$mail->SetFrom( $from_mail , $sender_name );
        $mail->AddReplyTo( $from_mail , $sender_name );
        $mail->AddAddress( $to_email , $to_name );
        $mail->Subject = "New Contact Query";
		$mail->MsgHTML( $sender_message );
		
        echo $mail->Send();
		exit;		
	} /* end of isset($_POST) */
?>