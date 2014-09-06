<?php if (!defined('APPLICATION')) exit();


// Define the plugin:
$PluginInfo['DefaultAvatar'] = array(
   'Name' => 'DefaultAvatar',
   'Description' => "Provides a custom default user avatar if they have not uploaded one. ",
   'Version' => '1.2',
   'Author' => 'VrijVlinder',
   'AuthorEmail' => 'contact@vrijvlinder.com.com',
   'AuthorUrl' => 'http://www.vrijvlinder.com/',
   'MobileFriendly' => TRUE,
   "SettingsPermission" => "Garden.Settings.Manage",
    "SettingsUrl" => "/settings/defaultavatar"
);

class DefaultAvatarPlugin extends Gdn_Plugin{


    public function OnDisable() {
      return TRUE;
   }
   
    public function SettingsController_DefaultAvatar_Create($Sender){
        



        $Sender->Permission("Garden.Settings.Manage");
        $Sender->SetData("Title", T("Default Avatar"));
        $Sender->AddSideMenu("dashboard/settings/plugins");

        $Conf = new ConfigurationModule($Sender);
        $Conf->Initialize(array(
            "Plugins.DefaultAvatarPlugin.AvatarUrl" => array(
                "Description" => T("Add the Url for the image you want to be the Default User Avatar"),
                "Default" => 'https://vanillicon.com/design/noicon.png',
                
            ),
            "Plugins.DefaultAvatarPlugin.Deleted" => array(
                "Description" => T("What should deleted User Names be replaced with instead of [Deleted User] ?"),
                "Default" => "Bob"
                
            ),
            "Plugins.DefaultAvatarPlugin.md5" => array(
                "Description" => T("Should User Names be hashed with").'<a href="http://en.wikipedia.org/wiki/MD5" title="What is MD5 ?" target="_blank"> md5 ?</a>',
                "Control" => "CheckBox",
                "LabelCode" => T("Hash User Names with md5"),
                "Default" => "0"
            )

        ));

        $Conf->RenderAll();  
    }

   
    public function ProfileController_AfterAddSideMenu_Handler($Sender, $Args){
        if (!$Sender->User->Photo) {
            $UserName = GetValue("Name", $Sender->User);

            // A substitute name for deleted users
            if ($UserName == "[Deleted User]") {
                $UserName = C("Plugins.DefaultAvatarPlugin.Deleted", "Bob");
            }

            // Md5
            if(C("Plugins.DefaultAvatarPlugin.md5", 0) == 1) {
                $UserName = md5($UserName);
            }

            // Handle PhotoUrl
            $PhotoUrl = C("Plugins.DefaultAvatarPlugin.AvatarUrl", "https://vanillicon.com/design/noicon.png");
            $PhotoUrl = str_replace("%user%", $UserName, $PhotoUrl);

            $Sender->User->Photo = $PhotoUrl;
        }
    }
}


if (!function_exists("UserPhotoDefaultUrl")) {
    
    function UserPhotoDefaultUrl($User, $Options = array()){
        
        $UserName = GetValue("Name", $User);

        // A substitute name for deleted users
        if ($UserName == "[Deleted User]") {
            $UserName = C("Plugins.DefaultAvatarPlugin.Deleted", "Bob");
        }

        // Md5
        if(C("Plugins.DefaultAvatarPlugin.md5", 0) == 1) {
            $UserName = md5($UserName);
        }

        // Handle PhotoUrl
        $PhotoUrl = C("Plugins.DefaultAvatarPlugin.AvatarUrl", "https://vanillicon.com/design/noicon.png");
        $PhotoUrl = str_replace("%user%", $UserName, $PhotoUrl);


        return $PhotoUrl;
    }
}