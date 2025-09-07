{ config, pkgs, ... }:

{

    programs.firefox = {
	enable = true;
	profiles.default = {
	    bookmarks = {
		force = true;
		settings = [
		    {
			toolbar = true;
			bookmarks = [
			    #Folder
			    { 
				name = "NixOS";
				bookmarks = [
				    {
					name = "Search NixOS"; 
					url = "https://search.nixos.org";
				    }
				    {
					name = "My Nixos";
					url = "https://mynixos.org";
				    }
				];
			    }
			    {
				name = "ETH";
			    }
			    /*Individual
			    {
			    	name = "Proton"; 
			    	url = "https://mail.proton.me";
			    }*/
			];
		    }
		];
	    };
	};
    };

}
