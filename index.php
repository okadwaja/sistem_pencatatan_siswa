<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Login - Sistem Pencatatan Prestasi & Pelanggaran Siswa</title>
    <script language="JavaScript">
        var txt=":: Login - Sistem Pencatatan Prestasi & Pelanggaran Siswa ";
        var kecepatan=250;var segarkan=null;function bergerak() { document.title=txt;
        txt=txt.substring(1,txt.length)+txt.charAt(0);
        segarkan=setTimeout("bergerak()",kecepatan);}bergerak();
    </script>

    <link rel="shortcut icon" href="images/fav.png">
    <link rel="stylesheet" href="login-style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>

<body>
    <div class="box">
            <video id="bg-video" src="images/bgVideos.mp4" loop muted autoplay>
            </video>

        <div class="container">
            <div class="title">
                <header>Selamat Datang di<br></header>
                <header><b>SISTEM PENCATATAN PRESTASI DAN PELANGGARAN SISWA</b></header>
            </div>
        </div>
        
        <form action="login.php" method="post" >
        <div class="container">
            
            <div class="top">
                <header>Login</header>
            </div>
            <div class="input-field">
                <input type="text" class="input" placeholder="Username" required="" name="username"/>
                <i class='bx bx-user'></i>
            </div>
            <div class="input-field">
                <input type="Password" class="input" placeholder="Password" required="" name="password"/>
                <i class='bx bx-lock-alt'></i>
            </div>
            <div class="input-field">
                <input type="submit" class="submit" value="Login" id="" href="login.php">
            </div>
        </div>
        </form>
    </div>
</body>
</html>