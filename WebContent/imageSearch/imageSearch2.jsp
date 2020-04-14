<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Image Search</title>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

		<style type="text/css">
			body {
				font-family: sans-serif;
				background-color: #ffffff;
			}
			
			.file-upload {
				padding: 15% 3%;
				margin: 0 auto;
				border-radius: 10px;
				border: solid 1.5px #f6f7fa;
				background-color: #f6f7fa;
			}
			
			.file-upload-btn {
				width: 100%;
				margin: 0;
				color: #fff;
				background: #1FB264;
				border: none;
				padding: 10px;
				border-radius: 4px;
				border-bottom: 4px solid #15824B;
				transition: all .2s ease;
				outline: none;
				text-transform: uppercase;
				font-weight: 700;
			}
			
			.file-upload-btn:hover {
				background: #1AA059;
				color: #ffffff;
				transition: all .2s ease;
				cursor: pointer;
			}
			
			.file-upload-btn:active {
				border: 0;
				transition: all .2s ease;
			}
			
			.file-upload-content {
				display: none;
				text-align: center;
			}
			
			.file-upload-input {
				position: absolute;
				margin: 0;
				padding: 0;
				width: 100%;
				height: 100%;
				outline: none;
				opacity: 0;
				cursor: pointer;
			}
			
			.image-upload-wrap {
				width: 60%;
				margin: 0 auto;
				position: relative;
				object-fit: contain;
				border-radius: 10px;
				border: dashed 1.5px #35465d;
				background-color: #ffffff;
			}
			
			.image-dropping, .image-upload-wrap:hover {
				background-color: #35465d82;
				border: 1.5px dashed #ffffff;
			}
			
			.image-title-wrap {
				padding: 0 15px 15px 15px;
				color: #222;
			}
			
			.drag-text {
				text-align: center;
			}
			
			.drag-text h3 {
				font-weight: 500;
				text-transform: uppercase;
			}
			
			.file-upload-image {
				max-height: 200px;
				max-width: 200px;
				margin: auto;
				padding: 20px;
			}
			
			.remove-image {
				width: 200px;
				margin: 0;
				color: #fff;
				background: #cd4535;
				border: none;
				padding: 10px;
				border-radius: 4px;
				border-bottom: 4px solid #b02818;
				transition: all .2s ease;
				outline: none;
				text-transform: uppercase;
				font-weight: 700;
			}
			
			.remove-image:hover {
				background: #c13b2a;
				color: #ffffff;
				transition: all .2s ease;
				cursor: pointer;
			}
			
			.remove-image:active {
				border: 0;
				transition: all .2s ease;
			}
			
			.nav-distance {
				padding: 2.1% 7.7%;
			}
			
			.navbar-light .navbar-brand {
				font-family: NanumSquareR;
				line-height: 1.68;
				text-align: left;
				color: #35465d;
			}
			
			.navbar-light .navbar-toggler {
				border-color: #ffffff;
			}
			
			.section {
				margin-top: 100px;
			}
			
			.title {
				font-family: NanumSquareR;
				line-height: 1.67;
				text-align: center;
				color: #35465d;
			}
			
			.subtitle {
				font-family: NanumSquareR;
				line-height: 1.53;
				text-align: center;
				color: #35465d;
			}
			
			/* On screens that are 600px or less, set the background color to olive */
			@media screen and (max-width: 600px) {
				html {
					font-size: 10px;
				}
				.navbar-brand {
					font-size: 2rem;
				}
			}
			
			.youtube-link {
				font-family: NanumSquareR;
				font-size: 1.5rem;
				line-height: 1.71;
				text-align: center;
				color: #f73737;
				text-decoration: underline;
			}
			
			.youtube-link:hover {
				font-family: NanumSquareR;
				font-size: 1.5rem;
				line-height: 1.71;
				text-align: center;
				color: #f73737;
				text-decoration: underline;
			}
			
			.youtube-icon {
				width: 8%;
			}
			
			.upload {
				width: 20%;
			}
			
			.upload-text {
				width: 58%;
				font-family: NanumSquareR;
				font-size: 1.5rem;
				line-height: 1.53;
				text-align: center;
				color: #35465d;
				margin: 0 auto;
			}
		</style>
	</head>
	<body>
	
	<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#imageSearch">
  			Image Search
		</button>

		<!-- Modal -->
		<div class="modal fade" id="imageSearch" tabindex="-1" role="dialog" aria-labelledby="imageSearch" aria-hidden="true">
	  		<div class="modal-dialog" role="document">
		    	<div class="modal-content">
		      		<div class="modal-header">
				        <h5 class="modal-title" id="imageSearch">Image Search</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          	<span aria-hidden="true">&times;</span>
				        </button>
			 		</div>
		      		<div class="modal-body">
					    <div class="container file-upload">
					        <div class="image-upload-wrap">
					            <input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" />
					            <div class="drag-text">
					                <h3 class="mb-5 pb-5 pt-4  upload-text">Upload Picture</h3>
					            </div>
					        </div>
					        <div class="file-upload-content">
					            <img class="file-upload-image" id="upload-image" src="#" alt="your image" />
					            
					            <div id="loading" class="animated bounce">
					                <div class="spinner-border" role="status">
					                    <span class="sr-only">Loading...</span>
					                </div>
					                <p class="text-center">Analyzing...</p>
					            </div>
					            <p class="result-message"></p>
					            <div id="label-container" class="d-flex flex-column justify-content-around"></div>
					            <div class="addthis_inline_share_toolbox_6lz1"></div>
					            
					            <div class="image-title-wrap">
					                <button type="button" onclick="window.location.reload()" class="try-again-btn">
                    					<span class="try-again-text">retry</span>
                					</button>
					            </div>
					        </div>
					    </div>
					</div>
		      		<div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary">Save changes</button>
			      	</div>
		    	</div>
		  	</div>
		</div>

    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
    
    <script>
	    const URL = "https://teachablemachine.withgoogle.com/models/QNCMCYbnX/";
	    let model, webcam, labelContainer, maxPredictions;
	    async function init() {
	        const modelURL = URL + "model.json";
	        const metadataURL = URL + "metadata.json";
	        model = await tmImage.load(modelURL, metadataURL);
	        maxPredictions = model.getTotalClasses();
	        labelContainer = document.getElementById("label-container");
	        for (let i = 0; i < maxPredictions; i++) {
                var element = document.createElement("div")
                element.classList.add("d-flex");
                labelContainer.appendChild(element);
            }
	    }
	    async function predict() {
	        var image = document.getElementById("upload-image")
	        const prediction = await model.predict(image, false);
	        prediction.sort(function(a, b) { 
	        	parseFloat(b.probability) - parseFloat(a.probability); 
	        });
	        for (let i = 0; i < maxPredictions; i++) {
	            const classPrediction =
	                prediction[i].className;
	            labelContainer.childNodes[i].innerHTML = classPrediction;
	        }
	    }
    
	    function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('.image-upload-wrap').hide();
                    $('#loading').show();
                    $('.file-upload-image').attr('src', e.target.result);
                    $('.file-upload-content').show();
                    $('.image-title').html(input.files[0].name);
                };
                reader.readAsDataURL(input.files[0]);
                init().then(function() {
                    predict();
                    $('#loading').hide();
                });
            } else {
                removeUpload();
            }
        }

	    function removeUpload() {
            $('.file-upload-input').replaceWith($('.file-upload-input').clone());
            $('.file-upload-content').hide();
            $('.image-upload-wrap').show();
        }
        $('.image-upload-wrap').bind('dragover', function() {
            $('.image-upload-wrap').addClass('image-dropping');
        });
        $('.image-upload-wrap').bind('dragleave', function() {
            $('.image-upload-wrap').removeClass('image-dropping');
        });
    </script>

	</body>

</html>