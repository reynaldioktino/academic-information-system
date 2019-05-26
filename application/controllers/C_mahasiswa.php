<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_mahasiswa extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('M_jurusan');
		$this->load->model('M_mahasiswa');
		$this->load->model('M_dosen');
	}

	public function index()
	{
		$data['mahasiswa']=$this->M_mahasiswa->listMhs();
		$data['jurusan']=$this->M_jurusan->listJurusan();
		$data['dosen']=$this->M_dosen->listDosen();
		$this->load->view('mahasiswa', $data);
	}

	public function getAjax($id_jurusan = null)
	{
		$data['data'] = $this->M_mahasiswa->getMhs();
		if($id_jurusan != null)
			$data['data'] = $this->M_mahasiswa->getMhsWhereKj($id_jurusan);
		echo json_encode($data);
	}

	public function loadDelete($id){
		$data['record']=$this->M_mahasiswa->getMhsWhereId($id);//record dari getBiodata
		$this->load->view('mhs/delete', $data);
	}

	public function loadEdit($id){
		$data['jurusan']=$this->M_jurusan->listJurusan();
		$data['dosen']=$this->M_dosen->listDosen();
		$data['record']=$this->M_mahasiswa->getMhsWhereId($id);//record dari getBiodata
		$this->load->view('mhs/edit', $data);
	}

	public function add(){
		$upload=$this->M_mahasiswa->upload();
		if($upload['result']=="success"){
			$data = array(
				'nim'	=>	$this->input->post('nim'),
				'nama'	=>	$this->input->post('nama'),
				'jk'	=>	$this->input->post('jk'),
				'alamat'	=>	$this->input->post('alamat'),
				'kode_jurusan'	=>	$this->input->post('kode_jurusan'),
				'nip_wali'	=>	$this->input->post('nip_wali'),
				'foto'=> $upload['file']['file_name']
			);
			$level=2;
			$data2 = array(
				'uname'	=>	$this->input->post('nim'),
				'pwd'	=>	md5($this->input->post('nim')),
				'level'	=>	$level
			);
			$this->M_mahasiswa->insert($data);
			$this->M_mahasiswa->insertAkun($data2);
			redirect('mahasiswa');
		}else{
			$data['mahasiswa']=$this->M_mahasiswa->listMhs();
			$data['message']=$upload['error'];
			$this->load->view('mahasiswa', $data);
		}
	}

	// public function update(){
	// 	$upload=$this->M_mahasiswa->upload();
	// 	if($upload['result']=="success"){
	// 		$data = array(
	// 			'nim'	=>	$this->input->post('nim'),
	// 			'nama'	=>	$this->input->post('nama'),
	// 			'jk'	=>	$this->input->post('jk'),
	// 			'alamat'	=>	$this->input->post('alamat'),
	// 			'kode_jurusan'	=>	$this->input->post('kode_jurusan'),
	// 			'nip_wali'	=>	$this->input->post('nip_wali'),
	// 			'foto'=> $upload['file']['file_name']
	// 		);
	// 		$where=$this->input->post('id_old');
	// 		$this->M_mahasiswa->update($data, $where);
	// 		redirect('mahasiswa');
	// 	}else{
	// 		$data['mahasiswa']=$this->M_mahasiswa->listMhs();
	// 		$data['message']=$upload['error'];
	// 		$this->load->view('mahasiswa', $data);
	// 	}
	// }


	public function update()
	{
		if($_FILES['foto']['name']!="") //"foto" name dari input file, "name" itu punyanya $_FILES jdi ada tmp_name dll
		{
			$upload=$this->M_mahasiswa->upload();
			if($upload['result']=="success"){
				$image_name=$upload['file']['file_name'];
			}else{
				$data['mahasiswa']=$this->M_mahasiswa->listMhs();
				$data['message']=$upload['error'];
				$this->load->view('mahasiswa', $data);
			}
		}
		else{
			$image_name=$this->input->post('foto_old');
		}

		$data = array(
			'nim'	=>	$this->input->post('nim'),
			'nama'	=>	$this->input->post('nama'),
			'jk'	=>	$this->input->post('jk'),
			'alamat'	=>	$this->input->post('alamat'),
			'kode_jurusan'	=>	$this->input->post('kode_jurusan'),
			'nip_wali'	=>	$this->input->post('nip_wali'),
			'foto'=> $image_name
		);
		$where=$this->input->post('id_old');
		$this->M_mahasiswa->update($data, $where);
		redirect('mahasiswa');
	}

	public function delete(){
		$where=$this->uri->segment(3);
		$photo=$this->M_mahasiswa->dropFoto($where);
		if ($photo->num_rows() > 0)
		{
			$row = $photo->row();
			$file_photo = $row->foto;
			$path_file = './foto/';
			unlink($path_file.$file_photo);
			$this->M_mahasiswa->delete($where);
		}
		redirect('mahasiswa');
	}
}


<div class="form-group">
            <label for="" class="control-label col-xs-3">Jenis Pasien</label>
                <div class="col-xs-9">
                    <select class="form-control" name="jenis_add" id="jenis1">
                        <option value="baru">baru</option>
                        <option value="lama">lama</option>
                    </select>
                    <br>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-xs-3" >No. RM</label>
                <div class="col-xs-9">
                    <input name="no_rm_add" id="no_rm1" class="form-control" type="text"><br>
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-xs-3" >No. KTP</label>
                <div class="col-xs-9">
                    <input name="no_ktp_add" id="no_ktp1" class="form-control" type="number"><br>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-xs-3" >Nama</label>
                <div class="col-xs-9">
                    <input name="nama_add" id="nama1" class="form-control" type="text"><br>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-xs-3" >Alamat</label>
                <div class="col-xs-9">
                    <input name="alamat_add" id="alamat1" class="form-control" type="text"><br>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-xs-3" >Tempat Lahir</label>
                <div class="col-xs-9">
                    <input name="tempat_lahir_add" id="tempat_lahir1" class="form-control" type="text"><br>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-xs-3" >Tanggal Lahir</label>
                <div class="col-xs-9">
                    <input name="tanggal_lahir_add" id="tanggal_lahir1" class="form-control" type="date"><br>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-xs-3" >Umur</label>
                <div class="col-xs-9">
                    <input name="umur_add" id="umur1" class="form-control" type="text"><br>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-xs-3" >Status</label>
                <div class="col-xs-9">
                    <input name="status_add" id="status1" class="form-control" type="text"><br>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-xs-3" >Pendidikan</label>
                <div class="col-xs-9">
                    <input name="pendidikan_add" id="pendidikan1" class="form-control" type="text"><br>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-xs-3" >Pekerjaan</label>
                <div class="col-xs-9">
                    <input name="pekerjaan_add" id="pekerjaan1" class="form-control" type="text"><br>
                </div>
            </div>

            <div class="form-group">
            <label for="" class="control-label col-xs-3">Jenis Kelamin</label>
                <div class="col-xs-9">
                    <select class="form-control" name="jk_add" id="jk1">
                        <option value="Laki-Laki">Laki-laki</option>
                        <option value="Perempuan">Perempuan</option>
                    </select>
                    <br>
                    </div>
                </div>
            </div>