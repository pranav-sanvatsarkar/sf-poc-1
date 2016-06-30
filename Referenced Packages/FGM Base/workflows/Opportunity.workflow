<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>SendsanAlertwhenApplicationisSubmitted</fullName>
        <description>FGM - Application Submission Alert</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>FGM_Sample_Email_Templates/FGM_Application_Submission_Alert</template>
    </alerts>
    <fieldUpdates>
        <fullName>FGM_Set_Duration_if_Start_and_End_Date</fullName>
        <field>Duration_Months__c</field>
        <formula>IF(ISBLANK( Extended_End_Date__c ), 
                         ROUND((End_Date__c - Start_Date__c)/30.5,0), 
                         ROUND(( Extended_End_Date__c  - Start_Date__c)/30.5,0)
      )</formula>
        <name>FGM - Set Duration if Start and End Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FGM_Set_End_Date_if_Duration_is_Known</fullName>
        <field>End_Date__c</field>
        <formula>Start_Date__c + (30.42 * Duration_Months__c  )</formula>
        <name>FGM - Set End Date if Duration is Known</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FGM_Set_General_Support_Request_Name</fullName>
        <field>Name</field>
        <formula>Account.Name &amp; &quot; - General Support - &quot; &amp;  Request_Number__c</formula>
        <name>FGM - Set General Support Request Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>FGM - Application Submission Alert</fullName>
        <actions>
            <name>SendsanAlertwhenApplicationisSubmitted</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Application Submitted</value>
        </criteriaItems>
        <description>Sends an Alert to the Request Owner when Application is Submitted</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>FGM - Set Duration if Start and End Date are Known</fullName>
        <actions>
            <name>FGM_Set_Duration_if_Start_and_End_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Start_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.End_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Extended_End_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FGM - Set General Support Request Name</fullName>
        <actions>
            <name>FGM_Set_General_Support_Request_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Request_Type__c</field>
            <operation>equals</operation>
            <value>General Support</value>
        </criteriaItems>
        <description>If Request Type is &apos;General Support&apos;, then Request is set to &quot;[Org Name] - General Support - [Request Number]&quot;.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
