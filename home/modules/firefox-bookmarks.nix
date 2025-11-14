{
  config,
  pkgs,
  ...
}: {
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
                name = "Computer";
                bookmarks = [
                  {
                    name = "NixOS";
                    url = "https://nixos.org";
                    keyword = "nixos";
                  }
                  {
                    name = "Search NixOS Packages";
                    url = "https://search.nixos.org/packages?channel=unstable&";
                    keyword = "nixsp";
                  }
                  {
                    name = "Search NixOS Options";
                    url = "https://search.nixos.org/options?channel=unstable&";
                    keyword = "nixso";
                  }
                  {
                    name = "My Nixos";
                    url = "https://mynixos.com";
                    keyword = "nixm";
                  }
                  {
                    name = "CUPS Printing Service";
                    url = "http://localhost:631/";
                    keyword = "printer";
                  }
                  {
                    name = "Arch Wiki";
                    url = "https://wiki.archlinux.org/title/Main_page";
                  }
                  {
                    name = "Hyprland Wiki";
                    url = "https://wiki.hypr.land/";
                  }
                  {
                    name = "Software alternatives";
                    url = "https://alternativeto.net";
                  }
                  {
                    name = "Tools";
                    bookmarks = [
                      {
                        name = "Replace line breaks with \n";
                        url = "https://codepen.io/jsnelders/pen/qBByqQy";
                      }
                      {
                        name = "Latex Symbols";
                        url = "https://latexai.app/symbols";
                      }
                    ];
                  }
                  {
                    name = "Programming";
                    bookmarks = [
                      {
                        name = "Public AI";
                        url = "https://chat.publicai.co/";
                        keyword = "llm";
                      }
                      {
                        name = "ChatGPT";
                        url = "https://chatgpt.com";
                      }
                      {
                        name = "Fonts";
                        url = "https://www.fontspace.com/new/fonts";
                      }
                    ];
                  }
                ];
              }
              {
                name = "Science";
                bookmarks = [
                  {
                    name = "GitHub";
                    url = "https://github.com/julianbuerge";
                    keyword = "git";
                  }
                  {
                    name = "NGF ETH Research collection";
                    url = "https://www.research-collection.ethz.ch/entities/publication/3f85c3d3-501b-4563-b204-044b54074949";
                  }
                  {
                    name = "Scalable SciML Lab";
                    url = "https://scalable-sciml-lab.org/";
                  }
                  {
                    name = "Imperial Luca Magri";
                    url = "https://profiles.imperial.ac.uk/l.magri";
                  }
                ];
              }
              {
                name = "Math";
                bookmarks = [
                  {
                    name = "Geometric Analysis Gallery";
                    url = "https://mbschulz.github.io/";
                  }
                  {
                    name = "Penrose diagrams Penrose";
                    url = "https://anilzen.github.io/post/2022/drawing-penrose-diagrams/#:~:text=The%20coordinates%20of%20the%20Penrose,and%20plot%20them%20with%20TikZ";
                  }
                  {
                    name = "Professor Merry";
                    url = "https://www2.math.ethz.ch/will-merry/index.html";
                  }
                  {
                    name = "Statistics Calculator";
                    url = "https://www.socscistatistics.com/tests/";
                  }
                  {
                    name = "Mathematics Stack Exchange";
                    url = "https://math.stackexchange.com/users/1160260/gandalf-thegray";
                  }
                ];
              }
              {
                name = "Music";
                bookmarks = [
                  {
                    name = "Lilypond Sheet Music Collection";
                    url = "https://www.mutopiaproject.org/";
                  }
                  {
                    name = "Latin American Cello";
                    url = "https://www.cellobello.org/latin-american-cello-works/";
                  }
                  {
                    name = "8notes";
                    url = "https://www.8notes.com/Default.asp";
                  }
                  {
                    name = "Early Church Songs";
                    url = "https://westpark-baptist.com/ancient-christian-hymns/";
                  }
                  {
                    name = "ATLA Orchestra";
                    url = "https://flat.io/score/6137c6843d0ddb0015c0a947-avatar-the-last-airbender";
                  }
                  {
                    name = "ATLA Solo Cello";
                    url = "https://musescore.com/user/28485981/scores/6617766";
                  }
                ];
              }
              {
                name = "Entertainment";
                bookmarks = [
                  {
                    name = "CeDe";
                    url = "https://www.cede.ch/de/";
                    keyword = "cede";
                  }
                  {
                    name = "Müller Spring";
                    url = "https://cd.mueller-spring.ch";
                  }
                  {
                    name = "Presto Music";
                    url = "https://www.prestomusic.com";
                  }
                  {
                    name = "Maps";
                    url = "https://vemaps.com/";
                  }
                  {
                    name = "Star Wars Galaxy Map";
                    url = "http://www.swgalaxymap.com/";
                  }
                  {
                    name = "Souls Lore Shop";
                    url = "https://www.tuneandfairweather.com/";
                  }
                ];
              }
              {
                name = "Meteo & Maps";
                bookmarks = [
                  {
                    name = "Temperature";
                    url = "https://www.meteoswiss.admin.ch/services-and-publications/applications/temperature.html";
                  }
                  {
                    name = "Percipitation";
                    url = "https://www.meteoswiss.admin.ch/home.html?tab=rain";
                  }
                  {
                    name = "Forecast";
                    url = "https://www.meteoswiss.admin.ch/";
                  }
                  {
                    name = "Swiss map";
                    url = "https://map.geo.admin.ch";
                  }
                ];
              }
              {
                name = "Admin";
                bookmarks = [
                  {
                    name = "ETH Webshop Kanzlei";
                    url = "https://shop.akd.ethz.ch/";
                  }
                  {
                    name = "ETH MyAlumni";
                    url = "https://myalumni.ethz.ch/";
                  }
                  {
                    name = "ETH Alumni Email";
                    url = "https://myalumni.ethz.ch/webmail/";
                  }
                  {
                    name = "Proton Email";
                    url = "https://mail.proton.me";
                    keyword = "proton";
                  }
                  {
                    name = "Google Email";
                    url = "https://mail.google.com";
                    keyword = "gmail";
                  }
                ];
              }
              {
                name = "Work";
                bookmarks = [
                  {
                    name = "LinkedIn";
                    url = "https://www.linkedin.com/in/julianbuerge/";
                  }
                  {
                    name = "ETH Spinoffs";
                    url = "https://entrepreneurship.ethz.ch/startup-stories/explore-startup-portraits-and-success-stories/uebersicht-eth-spin-offs.html";
                  }
                  {
                    name = "Web Lernen";
                    url = "https://web-lernen.com/";
                  }
                  {
                    name = "Outlier";
                    url = "https://app.outlier.ai/expert";
                  }
                ];
              }
            ];
          }
        ];
      };
    };
  };
}
