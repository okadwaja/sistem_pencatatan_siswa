<?php
include "lib/config.php";
include "lib/koneksi.php";
//session_start();
if (empty($_SESSION['namauser']) AND empty($_SESSION['passuser'])) {
    echo "<center>Untuk mengakses modul, Anda harus login <br>";
    echo "<a href='$base_url'+'index.php><b>LOGIN</b></a></center>";
}
elseif ($_SESSION['akses']==1 or $_SESSION['akses']==2 or $_SESSION['akses']==3 or $_SESSION['akses']==4){ ?>        

        <div class="right_col" role="main">
          <div class="">


          <div class="row top_tiles">
              <div class="col-md-12">
                <div class="">
                  <div class="x_content">
                  <div class="col-md-12">
                    <div class="x_panel">
                      <div class="x_title">
                        <h2>Welcome to System</h2>
                        <div class="clearfix"></div>
                      </div>
                        <div class="x_content bs-example-popovers">
                          <div class="alert alert-success alert-dismissible " role="alert">

                            <strong><?php if($_SESSION['akses']==1){
                                          echo "Administrator";  
                            }elseif ($_SESSION['akses']==2) {
                              echo "Kesiswaan";
                            }elseif ($_SESSION['akses']==3) {
                              echo "Walikelas";
                            }elseif ($_SESSION['akses']==4) {
                              echo "Kepala Sekolah";
                            }
                            ?></strong>

                          </div>
                        </div>
                    </div>
                  </div>



                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">

                      

                      <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Pelanggaran</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Prestasi</a>
                          </li>
                        </ul>
                        
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                            <!-- start pelanggaran terbaru -->
                            <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>No</th>
                                  <th>Tanggal</th>
                                  <th>NIS</th>
                                  <th>Nama Siswa</th>
                                  <th>Pelanggaran</th>
                                </tr>
                              </thead>
                              <tbody>
                                 <?php 
                                    $tahun = mysqli_query($connect, "SELECT * FROM th_ajaran");
                                    $th = mysqli_fetch_array($tahun);

                                    $detail_poin = mysqli_query($connect,"SELECT * FROM detail_poin JOIN siswa ON siswa.nis=detail_poin.nis JOIN pelanggaran ON detail_poin.id_pelanggaran=pelanggaran.id_pelanggaran ORDER BY detail_poin.tanggal DESC LIMIT 10");
                                    $no=1;
                                    while($dp=mysqli_fetch_array($detail_poin)){
                
                                  ?>
                                <tr>
                                  <td><?php echo $no; ?></td>
                                  <td><?php echo $dp['tanggal']; ?></td>
                                  <td><?php echo $dp['nis']; ?></td>
                                  <td><?php echo $dp['nama_siswa']; ?></td>
                                  <td><?php echo $dp['nama_pelanggaran']; ?></td>
                                </tr>
                                <?php 
                                $no++;
                                } ?>
                                
                              </tbody>
                            </table>
                            <!-- end pelanggaran terbaru -->
                          </div>

                          <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="home-tab">
                            <!-- start prestasi terbaru -->
                            <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>No</th>
                                  <th>Tanggal</th>
                                  <th>NIS</th>
                                  <th>Nama Siswa</th>
                                  <th>Prestasi</th>
                                </tr>
                              </thead>
                              <tbody>
                                 <?php 
                                    $tahun = mysqli_query($connect, "SELECT * FROM th_ajaran");
                                    $th = mysqli_fetch_array($tahun);

                                    $detail_poin = mysqli_query($connect,"SELECT * FROM detail_poin JOIN siswa ON siswa.nis=detail_poin.nis JOIN prestasi ON detail_poin.id_prestasi=prestasi.id_prestasi ORDER BY detail_poin.tanggal DESC LIMIT 10");
                                    $no=1;
                                    while($dp=mysqli_fetch_array($detail_poin)){
                
                                  ?>
                                <tr>
                                  <td><?php echo $no; ?></td>
                                  <td><?php echo $dp['tanggal']; ?></td>
                                  <td><?php echo $dp['nis']; ?></td>
                                  <td><?php echo $dp['nama_siswa']; ?></td>
                                  <td><?php echo $dp['nama_prestasi']; ?></td>
                                </tr>
                                <?php 
                                $no++;
                                } ?>
                                
                              </tbody>
                            </table>
                            <!-- end prestasi terbaru -->
                          </div>
                          
                        </div>
                      </div>                      
                    </div>
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