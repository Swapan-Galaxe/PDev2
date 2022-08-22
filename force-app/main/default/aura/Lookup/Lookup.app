<aura:application >

    <aura:attribute name="id" type="String" default="" access="GLOBAL"/>
    <aura:attribute name="objNew" type="Account" default="{'sobjectType':'Account',  
                                                       'Id':null,'value':null}" />

    <!-- ... -->

    <div class="well">
        <div class="panel panel-primary">
            <div class="panel-heading">Existent sobject</div>
            <div class="panel-body">
                <div class="form-horizontal" >
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Contact</label>
                        <div class="col-sm-8">
                            <c:InputLookup type="Account"  
                                         value="{!v.id}"
                                         className="form-control "/>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label class="col-sm-2 control-label">Loaded contact</label>
                        <div class="col-sm-8 ">
                            <ui:inputText value="{!v.id}" 
                                          class="form-control"
                                          placeholder="Change id value"/>
                         </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-primary">
            <div class="panel-heading">New sobject</div>
            <div class="panel-body">
                <div class="form-horizontal" >
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Contact</label>
                    <div class="col-sm-8">
                      <c:InputLookup type="{!v.objNew.sobjectType}"
                                    value="{!v.objNew.Id}"  
                                    className="form-control "/>
                      </div>
                  </div>
                 <div class="form-group has-feedback">
                    <label class="col-sm-2 control-label">New contact</label>
                    <div class="col-sm-8 ">
                        <ui:inputText value="{!v.objNew.Id}" 
                                      class="form-control"
                                      placeholder="Change id value"/>
                     </div>
                     <div class="col-sm-8 ">
                        <ui:inputText value="{!v.objNew.value}" 
                                      class="form-control"
                                      placeholder="Change id value"/>
                     </div>
                  </div>
                </div>
            </div>
        </div>
    </div>

</aura:application>