$(document).keyup(function (e) {
	if (e.key === 'Escape') {
		CloseShop();
	}
});

$(document).keydown(function (e) // Disable Tab Key
{
    var keycode1 = (e.keyCode ? e.keyCode : e.which);
    if (keycode1 == 0 || keycode1 == 9) {
        e.preventDefault();
        e.stopPropagation();
    }
});

function CloseShop() {
	AllWeapon = {};
	$('.Status').hide();
	$('.tool').empty();
	$('.grenade').empty();
	$('.melee').empty();
	$('.pistol').empty();
	$('.submachine').empty();
	$('.assault').empty();
	$('.shotgun').empty();
	$('.sniper').empty();
	$('.weaponshop').hide();
	$('.modal').removeClass('visible');
	$.post(`https://${GetParentResourceName()}/focusOff`);
}

function formatMoney(n, c, d, t) {
    var c = isNaN(c = Math.abs(c)) ? 2 : c,
        d = d == undefined ? "." : d,
        t = t == undefined ? "," : t,
        s = n < 0 ? "-" : "",
        i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),
        j = (j = i.length) > 3 ? j % 3 : 0;

    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t);
};

var currentmoney = 0;
var AllWeapon = {};
var lastweaponname = "1"
window.addEventListener('message', function (event) {
	var data = event.data;
	
	if (data.type == "clearmenu") {
		AllWeapon = {};
		$('.tool').empty();
		$('.grenade').empty();
		$('.melee').empty();
		$('.pistol').empty();
		$('.submachine').empty();
		$('.assault').empty();
		$('.shotgun').empty();
		$('.sniper').empty();
	}
	if (data.display == true) {
		$('.weaponshop').show();
	}
	
	if (data.display == false) {
		$('.weaponshop').hide();
	}
	
	if (data.type == "showquickslot") {
		if(data.quickslot){
			$('.quickslot').show();
		}else{
			$('.quickslot').hide();
		}
	}
	
	if (data.type == "setcurrentmoney") {
		currentmoney = data.money
		$(".cash").html(formatMoney(currentmoney));
	}
	
	if (data.type == "addcurrentmoney") {
		currentmoney = currentmoney+data.money
		if(currentmoney > 25000){
			currentmoney = 25000
		}
		$(".cash").html(formatMoney(currentmoney));
	}
	
	if (data.type == "removecurrentmoney") {
		currentmoney = currentmoney-data.money
		$(".cash").html(formatMoney(currentmoney));
	}

	if (data.type == "createweaponmenu") {
		let disable = ""
		if(currentmoney < data.price){
			disable = "disable"
		}
		$('.type_'+data.weapontype).show();
		AllWeapon[data.item] = data.item;
		if(data.item.search("_mk2") != -1) {
			data.itemLabel = data.itemLabel.replace("Mk II", "")+"<span style='color:MediumPurple '>&nbsp;Mk II</span>"
		}
		$('.'+data.weapontype).append(`<div price="`+data.price+`" class="item `+data.item+` `+disable+`" onclick="buyItem('` + data.item + `', '` + data.weapontype + `', '` + data.price + `')"> <img class="img-item" src="nui://weaponselecter/html/img/items/` + data.item + `.png"> <div class="label"><p class="itemString `+`">&nbsp;&nbsp;&nbsp;&nbsp;` + data.itemLabel + `</p><p class="price">$`+formatMoney(data.price)+`</p> </div> </div> `);
	}

	if (data.type === "playSound"){
		audioPlayer = new Howl({src: ["./sounds/"+data.name+".ogg"], volume: 0.1});
		audioPlayer.play();
	}
	
	if (data.type == "removeweapon") {
		$('.'+data.weapon).empty();
	}
	
	if (data.type == "removetype") {
		$('.type_'+data.weapontype).hide();
	}
	
	if (data.type == "setStatusHUD") {
		if(!data.retval){
			$(".Status").hide()
		}else{
			$(".Status").show()
		}

		if(data.hudDamage==0){
			$('.status_damage_block').hide();
		}else{
			$('.status_damage_block').show();
		}
		if(data.hudSpeed==0){
			$('.status_firerate_block').hide();
		}else{
			$('.status_firerate_block').show();
		}
		if(data.hudAccuracy==0){
			$('.status_accuracy_block').hide();
		}else{
			$('.status_accuracy_block').show();
		}
		if(data.hudRange==0){
			$('.status_range_block').hide();
		}else{
			$('.status_range_block').show();
		}
		
		$('.status_damage').css("width", data.hudDamage+"%");
		$('.status_firerate').css("width", data.hudSpeed+"%");
		$('.status_accuracy').css("width", data.hudAccuracy+"%");
		$('.status_range').css("width", data.hudRange+"%");
	}
	
	$(".item").mouseenter(function(e){
		var weaponname = $(this).attr("class").split(' ')[1]
		if(lastweaponname != weaponname){
			lastweaponname = weaponname
			$(".Status").css("left", e.pageX + 50);
			$(".Status").css("top", e.pageY- 50);
			$(".Status").show();
			$.post(`https://${GetParentResourceName()}/getweaponstatus`,
				JSON.stringify({
				weaponname: weaponname,
			}));
		}
	});

	if (data.type == "setquickslot") {
		if(data.weapon){
			$(".quickslot-ammoIcon"+data.slot+"").show()
			if(Number(data.slotcount) > 1){
				$(".quickslotnext"+data.slot).show();
				$(".quickslot"+data.slot+"-ammo").html(data.ammoclipnext)
				$(".quickslot"+data.slot).attr("src", "nui://weaponselecter/html/img/items/"+data.weaponnext+".png");
				$(".quickslotnext"+data.slot).attr("src", "nui://weaponselecter/html/img/items/"+data.weapon+".png");
				$(".quickslotnext"+data.slot+"-ammo").html(data.ammoclip)
			}else{
				$(".quickslotnext"+data.slot).hide();
				$(".quickslotnext"+data.slot+"-ammo").html("⠀")
				$(".quickslot"+data.slot+"-ammo").html(data.ammoclip)
				$(".quickslot"+data.slot).attr("src", "nui://weaponselecter/html/img/items/"+data.weapon+".png");
			}
		}else{
			$(".quickslot"+data.slot+"-ammo").html("⠀")
			$(".quickslotnext"+data.slot+"-ammo").html("⠀")
			$(".quickslot-ammoIcon"+data.slot+"").hide()
			$(".quickslotnext"+data.slot).hide();
			$(".quickslot"+data.slot).attr("src", "nui://weaponselecter/html/img/items/unarmed.png");
		}
	}
	
	if (data.type == "usequickslot") {
		$(".quickslot1_block").css("background-color", "rgba(0, 0, 0, 0.5)");
		$(".quickslot2_block").css("background-color", "rgba(0, 0, 0, 0.5)");
		$(".quickslot3_block").css("background-color", "rgba(0, 0, 0, 0.5)");
		$(".quickslot4_block").css("background-color", "rgba(0, 0, 0, 0.5)");
		if(data.slot != "0") {
			$(".quickslot"+data.slot+"_block").css("background-color", "rgba(100, 100, 100, 0.5)");
		}
	}
});

function buyItem(name, type, price) {
	if(currentmoney >= price){
		currentmoney = currentmoney-price
		$(".cash").html(formatMoney(currentmoney));
		$.post(`https://${GetParentResourceName()}/buyItem`,
			JSON.stringify({
			name: name,
			type: type,
			price: price,
			skin: parseInt($("#weapon_skin").val()),
		}));
		
		Object.values(AllWeapon).forEach(weaponname => {
			var price = $("."+weaponname).attr("price")
			if(price>currentmoney){
				$("."+weaponname).addClass("disable")
			}
		});
		
	}else{
		$.post(`https://${GetParentResourceName()}/nomoney`);
	}
}