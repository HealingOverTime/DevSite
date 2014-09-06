<?php if (!defined('APPLICATION')) exit();
if (!Gdn::Session()->CheckPermission('Garden.Users.Edit'))   exit();
?>

<h1><?php echo Gdn::Translate('Cleanser - The Perfect Adminstration helper | by: Peregrine'); ?></h1>

<div class="Warning">
<?php echo Gdn::Translate("A click on the donation button always helps if you like the plugin."); ?>
</div>
<table>
<tr><td>
<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="R78ZA8B7MTFYW">
<p></p>
 Click here to Donate &#8611; &#8611; &#8611; &#8611; &#8611; &#8611; 
                <input type="image" width="150px" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">

<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>
</td></tr>
</table>
<div class="Warning">
<?php echo "Your donations help support development. Thanks for taking the time to send a donation, if you found the plugin helpful." ?>
</div>




<?php
echo $this->Form->Open();
echo $this->Form->Errors();
?>



 <table class="AltRows">
  <thead>
        <tr>
            <th><?php echo Gdn::Translate('Item'); ?></th>
            <th class="Alt"><?php echo Gdn::Translate('Value'); ?></th>
        </tr>
    </thead>
    <tbody>
   <tr>
    <td class="Alt">
<?php echo Gdn::Translate('Enter Number of Records to Search (suggested: 500 or less)'); ?>
    </td>


    <td>
        <?php
        echo $this->Form->TextBox('Plugins.Cleanser.MaxRecords');
        ?>
    </td>

</tr>   

<tr>
    <td class="Alt">
<?php echo Gdn::Translate('Offset: (skip N records)'); ?>
    </td>


    <td>
        <?php
        echo $this->Form->TextBox('Plugins.Cleanser.Offset');
        ?>
    </td>

</tr>    

<tr>

    <td class="Alt">
<?php echo Gdn::Translate('Select Role (RoleID):'); ?>
    </td>

    <td>

        <?php
        $Fields = array('TextField' => 'Code', 'ValueField' => 'Code');
        $Options = ($this->RoleData);
        echo $this->Form->DropDown('Plugins.Cleanser.RoleSet', $Options, $Fields);
        ?>
    </td>
</tr>    

<tr>
    <td class="Alt">
<?php echo Gdn::Translate('Enter Exact IP address if you are selecting on a specific IP Address:'); ?>
    </td>


    <td>
        <?php
        echo $this->Form->TextBox('Plugins.Cleanser.IPAddress');
        ?>
    </td>

</tr>         

<tr>

<tr>
    <td class="Alt">
<?php echo Gdn::Translate('Discovery Text Pattern to Match (Reason for Joining)  - be very specific - so you do not get False Matches:'); ?>
    </td>


    <td>
        <?php
        echo $this->Form->TextBox('Plugins.Cleanser.PatternMatch', array('class' => 'Patterninput', 'size' => "80"));
        ?>
    </td>

</tr>         


<tr>
    <td class="Alt">
        <?php echo Gdn::Translate('Action to be taken:'); ?>
    </td> 
    <td>
        <?php
        $Options = array('create' => 'create cleanser list', 'delete' => 'purge users');
        $Fields = array('TextField' => 'Code', 'ValueField' => 'Code');
        echo $this->Form->DropDown('Plugins.Cleanser.Action', $Options, $Fields);
        ?>
    </td>
</tr> 
</tbody>
</table>
<h3><b>Important: Please Back up your database before purging.</b> <p><b>  Each time you change role or ipaddress you must create a new list.  See the readme.txt for additional caveats. </b></p> </h3>             
<h3> 1) Select "role", enter ip address (optional), select "create cleanser list" then click submit</h3>
<h3> 2) View the cleanser list created from option in the moderation panel on left or <a href=index.php?p=/plugin/cleanser>View List Here</a></h3>
<h3> 3) if desired, edit cleanser list to manually delete line entries (via Cpanel or file transfer). If desired, Select action "purge users" from dropdown box to remove users from database after you have followed the above steps</h3>
<br />

<?php echo $this->Form->Close('Submit');






