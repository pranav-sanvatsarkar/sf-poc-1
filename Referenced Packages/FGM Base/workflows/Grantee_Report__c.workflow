<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>FGM_Grantee_Report_Awardee_Reminder</fullName>
        <description>FGM - Grantee Report Awardee Reminder</description>
        <protected>false</protected>
        <recipients>
            <field>Report_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FGM_Sample_Email_Templates/FGM_Grantee_Report_Awardee_Reminder</template>
    </alerts>
</Workflow>
