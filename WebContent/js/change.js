// JavaScript Document

function changeMenu(number, isflag) {

		switch (number) {
		case 1:
			var menu = document.getElementById("menu1");
			menu.className = "active";
			document.getElementById("menu2").className = "";
			if (isflag == 1)
				document.getElementById("menu3").className = "";
			document.getElementById("menu4").className = "";
			document.getElementById("menu5").className = "";
			document.getElementById("menu6").className = "";
			document.getElementById("menu7").className = "";
			
			break;
		case 2:
			var menu = document.getElementById("menu2");
			menu.className = "active";
			document.getElementById("menu1").className = "";
			if (isflag == 1)
				document.getElementById("menu3").className = "";
			document.getElementById("menu4").className = "";
			document.getElementById("menu5").className = "";
			document.getElementById("menu6").className = "";
			document.getElementById("menu7").className = "";
			break;
		case 3:
			if (isflag == 1) {
				var menu = document.getElementById("menu3");
				menu.className = "active";
				
				document.getElementById("menu1").className = "";
				document.getElementById("menu2").className = "";
				document.getElementById("menu4").className = "";
				document.getElementById("menu5").className = "";
				document.getElementById("menu6").className = "";
				document.getElementById("menu7").className = "";
			}
			break;
		case 4:
			var menu = document.getElementById("menu4");
			menu.className = "active";
			document.getElementById("menu1").className = "";
			document.getElementById("menu2").className = "";
			if (isflag == 1)
				document.getElementById("menu3").className = "";
			document.getElementById("menu5").className = "";
			document.getElementById("menu6").className = "";
			document.getElementById("menu7").className = "";
			break;
		case 5:
			var menu = document.getElementById("menu5");
			menu.className = "active";
			document.getElementById("menu1").className = "";
			document.getElementById("menu2").className = "";
			if (isflag == 1)
				document.getElementById("menu3").className = "";
			document.getElementById("menu4").className = "";
			document.getElementById("menu6").className = "";
			document.getElementById("menu7").className = "";
			
			break;
		case 6:
			var menu = document.getElementById("menu6");
			menu.className = "active";
			document.getElementById("menu1").className = "";
			document.getElementById("menu2").className = "";
			if (isflag == 1)
				document.getElementById("menu3").className = "";
			document.getElementById("menu4").className = "";
			document.getElementById("menu5").className = "";
			document.getElementById("menu7").className = "";
			
			break;
		 case 7:
		var menu = document.getElementById("menu7");
		menu.className = "active";
		document.getElementById("menu2").className="";
		document.getElementById("menu3").className="";
		document.getElementById("menu4").className="";
		document.getElementById("menu5").className="";
		document.getElementById("menu6").className="";
		document.getElementById("menu1").className="";
		break; 
		default:
			break;
		}

	}