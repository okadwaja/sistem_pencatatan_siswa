<?php
include "lib/config.php";
include "lib/koneksi.php";
//session_start();
if (empty($_SESSION['namauser']) AND empty($_SESSION['passuser'])) {
    echo "<center>Untuk mengakses modul, Anda harus login <br>";
    echo "<a href=$admin_url><b>LOGIN</b></a></center>";
}
elseif ($_SESSION['akses']==1 or $_SESSION['akses']==2 or $_SESSION['akses']==3 or $_SESSION['akses']==4){ ?>        
<div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <a href="main.php?module=laporan_prestasi"><button type="button" class="btn btn-round btn-primary"><i class="glyphicon glyphicon-arrow-left"></i> Kembali</button> </a>
                
              </div>


              <?php 
              $tahun_ajaran=mysqli_query($connect, "SELECT * FROM th_ajaran");
              $ta=mysqli_fetch_array($tahun_ajaran);
              $thAjaran=$ta['tahun_ajaran'];

              $idKelas=$_GET['id_kelas'];
              $kelas=mysqli_query($connect, "SELECT * FROM kelas JOIN jurusan ON kelas.id_jurusan=jurusan.id_jurusan WHERE id_kelas='$idKelas'");
              $kls=mysqli_fetch_array($kelas);


              ?>
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Laporan Prestasi Siswa</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <h4 align="center">Laporan Prestasi Siswa</h4>
                    <h4 align="center">Kelas <?php echo $kls['tingkat_kelas']." ".$kls['nama_jurusan']." ".$kls['sub_kelas'] ?></h4>
                    <!--<p class="text-muted font-13 m-b-30">
                      The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                    </p>-->
                    <table id="datatable-buttons" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>No</th>
                          <th>NIS</th>
                          <th>Nama Siswa</th>
                          <th>Total Poin Prestasi</th>
                        </tr>
                      </thead>


                      <tbody>
                        <?php
                        $siswa=mysqli_query($connect, "SELECT * FROM siswa WHERE id_kelas='$idKelas' ORDER BY nis");
                        $no=1;
                        while($sw=mysqli_fetch_array($siswa)){
                        $nis=$sw['nis'];

                        $poin_prestasi=mysqli_query($connect, "SELECT SUM(prestasi.poin) AS jml FROM detail_poin JOIN prestasi ON detail_poin.id_prestasi=prestasi.id_prestasi WHERE detail_poin.nis='$nis'");
                        $pp=mysqli_fetch_array($poin_prestasi);
                        $totPoin=$pp['jml'];

                         ?>
                        <tr>
                          <td><?php echo $no; ?></td>
                          <td><a href="main.php?module=detail_siswa&nis=<?php echo $sw['nis'];?>&sb=laporan_prestasi&id_kelas=<?php echo $idKelas;?>"><?php echo $sw['nis']; ?></a></td>
                          <td><a href="main.php?module=detail_siswa&nis=<?php echo $sw['nis'];?>&sb=laporan_prestasi&id_kelas=<?php echo $idKelas;?>"><?php echo $sw['nama_siswa']; ?></td>
                          <td><?php echo $totPoin; ?></td>
                        </tr>

                        <?php
                        $no++;
                        }
                         ?>
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>


            </div>
          </div>
        </div>
<?php 
}
else{
  echo "Anda Harus Login Untuk Mengakses Halaman Ini";
}
 ?>