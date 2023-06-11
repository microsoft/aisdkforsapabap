"use strict";(self.webpackChunkaisdkdocumentation=self.webpackChunkaisdkdocumentation||[]).push([[719],{3905:(e,t,a)=>{a.d(t,{Zo:()=>u,kt:()=>k});var r=a(7294);function n(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}function l(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,r)}return a}function o(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?l(Object(a),!0).forEach((function(t){n(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):l(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function i(e,t){if(null==e)return{};var a,r,n=function(e,t){if(null==e)return{};var a,r,n={},l=Object.keys(e);for(r=0;r<l.length;r++)a=l[r],t.indexOf(a)>=0||(n[a]=e[a]);return n}(e,t);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(r=0;r<l.length;r++)a=l[r],t.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(e,a)&&(n[a]=e[a])}return n}var s=r.createContext({}),d=function(e){var t=r.useContext(s),a=t;return e&&(a="function"==typeof e?e(t):o(o({},t),e)),a},u=function(e){var t=d(e.components);return r.createElement(s.Provider,{value:t},e.children)},p="mdxType",m={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},c=r.forwardRef((function(e,t){var a=e.components,n=e.mdxType,l=e.originalType,s=e.parentName,u=i(e,["components","mdxType","originalType","parentName"]),p=d(a),c=n,k=p["".concat(s,".").concat(c)]||p[c]||m[c]||l;return a?r.createElement(k,o(o({ref:t},u),{},{components:a})):r.createElement(k,o({ref:t},u))}));function k(e,t){var a=arguments,n=t&&t.mdxType;if("string"==typeof e||n){var l=a.length,o=new Array(l);o[0]=c;var i={};for(var s in t)hasOwnProperty.call(t,s)&&(i[s]=t[s]);i.originalType=e,i[p]="string"==typeof e?e:n,o[1]=i;for(var d=2;d<l;d++)o[d]=a[d];return r.createElement.apply(null,o)}return r.createElement.apply(null,a)}c.displayName="MDXCreateElement"},5162:(e,t,a)=>{a.d(t,{Z:()=>o});var r=a(7294),n=a(6010);const l={tabItem:"tabItem_Ymn6"};function o(e){let{children:t,hidden:a,className:o}=e;return r.createElement("div",{role:"tabpanel",className:(0,n.Z)(l.tabItem,o),hidden:a},t)}},4866:(e,t,a)=>{a.d(t,{Z:()=>v});var r=a(7462),n=a(7294),l=a(6010),o=a(2466),i=a(6550),s=a(1980),d=a(7392),u=a(12);function p(e){return function(e){return n.Children.map(e,(e=>{if(!e||(0,n.isValidElement)(e)&&function(e){const{props:t}=e;return!!t&&"object"==typeof t&&"value"in t}(e))return e;throw new Error(`Docusaurus error: Bad <Tabs> child <${"string"==typeof e.type?e.type:e.type.name}>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.`)}))?.filter(Boolean)??[]}(e).map((e=>{let{props:{value:t,label:a,attributes:r,default:n}}=e;return{value:t,label:a,attributes:r,default:n}}))}function m(e){const{values:t,children:a}=e;return(0,n.useMemo)((()=>{const e=t??p(a);return function(e){const t=(0,d.l)(e,((e,t)=>e.value===t.value));if(t.length>0)throw new Error(`Docusaurus error: Duplicate values "${t.map((e=>e.value)).join(", ")}" found in <Tabs>. Every value needs to be unique.`)}(e),e}),[t,a])}function c(e){let{value:t,tabValues:a}=e;return a.some((e=>e.value===t))}function k(e){let{queryString:t=!1,groupId:a}=e;const r=(0,i.k6)(),l=function(e){let{queryString:t=!1,groupId:a}=e;if("string"==typeof t)return t;if(!1===t)return null;if(!0===t&&!a)throw new Error('Docusaurus error: The <Tabs> component groupId prop is required if queryString=true, because this value is used as the search param name. You can also provide an explicit value such as queryString="my-search-param".');return a??null}({queryString:t,groupId:a});return[(0,s._X)(l),(0,n.useCallback)((e=>{if(!l)return;const t=new URLSearchParams(r.location.search);t.set(l,e),r.replace({...r.location,search:t.toString()})}),[l,r])]}function g(e){const{defaultValue:t,queryString:a=!1,groupId:r}=e,l=m(e),[o,i]=(0,n.useState)((()=>function(e){let{defaultValue:t,tabValues:a}=e;if(0===a.length)throw new Error("Docusaurus error: the <Tabs> component requires at least one <TabItem> children component");if(t){if(!c({value:t,tabValues:a}))throw new Error(`Docusaurus error: The <Tabs> has a defaultValue "${t}" but none of its children has the corresponding value. Available values are: ${a.map((e=>e.value)).join(", ")}. If you intend to show no default tab, use defaultValue={null} instead.`);return t}const r=a.find((e=>e.default))??a[0];if(!r)throw new Error("Unexpected error: 0 tabValues");return r.value}({defaultValue:t,tabValues:l}))),[s,d]=k({queryString:a,groupId:r}),[p,g]=function(e){let{groupId:t}=e;const a=function(e){return e?`docusaurus.tab.${e}`:null}(t),[r,l]=(0,u.Nk)(a);return[r,(0,n.useCallback)((e=>{a&&l.set(e)}),[a,l])]}({groupId:r}),N=(()=>{const e=s??p;return c({value:e,tabValues:l})?e:null})();(0,n.useLayoutEffect)((()=>{N&&i(N)}),[N]);return{selectedValue:o,selectValue:(0,n.useCallback)((e=>{if(!c({value:e,tabValues:l}))throw new Error(`Can't select invalid tab value=${e}`);i(e),d(e),g(e)}),[d,g,l]),tabValues:l}}var N=a(2389);const f={tabList:"tabList__CuJ",tabItem:"tabItem_LNqP"};function h(e){let{className:t,block:a,selectedValue:i,selectValue:s,tabValues:d}=e;const u=[],{blockElementScrollPositionUntilNextRender:p}=(0,o.o5)(),m=e=>{const t=e.currentTarget,a=u.indexOf(t),r=d[a].value;r!==i&&(p(t),s(r))},c=e=>{let t=null;switch(e.key){case"Enter":m(e);break;case"ArrowRight":{const a=u.indexOf(e.currentTarget)+1;t=u[a]??u[0];break}case"ArrowLeft":{const a=u.indexOf(e.currentTarget)-1;t=u[a]??u[u.length-1];break}}t?.focus()};return n.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,l.Z)("tabs",{"tabs--block":a},t)},d.map((e=>{let{value:t,label:a,attributes:o}=e;return n.createElement("li",(0,r.Z)({role:"tab",tabIndex:i===t?0:-1,"aria-selected":i===t,key:t,ref:e=>u.push(e),onKeyDown:c,onClick:m},o,{className:(0,l.Z)("tabs__item",f.tabItem,o?.className,{"tabs__item--active":i===t})}),a??t)})))}function b(e){let{lazy:t,children:a,selectedValue:r}=e;const l=(Array.isArray(a)?a:[a]).filter(Boolean);if(t){const e=l.find((e=>e.props.value===r));return e?(0,n.cloneElement)(e,{className:"margin-top--md"}):null}return n.createElement("div",{className:"margin-top--md"},l.map(((e,t)=>(0,n.cloneElement)(e,{key:t,hidden:e.props.value!==r}))))}function y(e){const t=g(e);return n.createElement("div",{className:(0,l.Z)("tabs-container",f.tabList)},n.createElement(h,(0,r.Z)({},e,t)),n.createElement(b,(0,r.Z)({},e,t)))}function v(e){const t=(0,N.Z)();return n.createElement(y,(0,r.Z)({key:String(t)},e))}},3209:(e,t,a)=>{a.r(t),a.d(t,{assets:()=>p,contentTitle:()=>d,default:()=>g,frontMatter:()=>s,metadata:()=>u,toc:()=>m});var r=a(7462),n=(a(7294),a(3905)),l=a(4866),o=a(5162),i=a(5412);const s={sidebar_position:2,title:"Models",description:"Working with Models using AI SDK.",toc_min_heading_level:2,toc_max_heading_level:5},d="AI SDK for SAP Models Overview",u={unversionedId:"working-with-sdk/models",id:"working-with-sdk/models",title:"Models",description:"Working with Models using AI SDK.",source:"@site/docs/3-working-with-sdk/2_models.mdx",sourceDirName:"3-working-with-sdk",slug:"/working-with-sdk/models",permalink:"/aisdkforsapabap/docs/working-with-sdk/models",draft:!1,tags:[],version:"current",sidebarPosition:2,frontMatter:{sidebar_position:2,title:"Models",description:"Working with Models using AI SDK.",toc_min_heading_level:2,toc_max_heading_level:5},sidebar:"tutorialSidebar",previous:{title:"Initialize SDK",permalink:"/aisdkforsapabap/docs/working-with-sdk/initialize_sdk"},next:{title:"Deployments",permalink:"/aisdkforsapabap/docs/working-with-sdk/deployments"}},p={},m=[{value:"Demo Program",id:"demo-program",level:2},{value:"Operations",id:"operations",level:2},{value:"Models - Get",id:"models---get",level:3},{value:"Parameters and Exceptions",id:"parameters-and-exceptions",level:4},{value:"Responses/Status Code",id:"responsesstatus-code",level:4},{value:"Models - List",id:"models---list",level:3},{value:"Parameters and Exceptions",id:"parameters-and-exceptions-1",level:4},{value:"Responses/Status Code",id:"responsesstatus-code-1",level:4}],c={toc:m},k="wrapper";function g(e){let{components:t,...a}=e;return(0,n.kt)(k,(0,r.Z)({},c,a,{components:t,mdxType:"MDXLayout"}),(0,n.kt)("h1",{id:"ai-sdk-for-sap-models-overview"},"AI SDK for SAP Models Overview"),(0,n.kt)(i.ZP,{mdxType:"AiEngineAndVersion"}),(0,n.kt)("h2",{id:"demo-program"},"Demo Program"),(0,n.kt)(l.Z,{groupId:"aienginechoice",mdxType:"Tabs"},(0,n.kt)(o.Z,{value:"azoai",label:"Azure Open AI",default:!0,mdxType:"TabItem"},(0,n.kt)("table",null,(0,n.kt)("thead",{parentName:"table"},(0,n.kt)("tr",{parentName:"thead"},(0,n.kt)("th",{parentName:"tr",align:null},"Program Name"),(0,n.kt)("th",{parentName:"tr",align:null},"Package"),(0,n.kt)("th",{parentName:"tr",align:null},"Description"))),(0,n.kt)("tbody",{parentName:"table"},(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"ZP_MSAISDKDEMO_MODELS")),(0,n.kt)("td",{parentName:"tr",align:null},"ZPENGG_AZOAI_SDK_DEMOS"),(0,n.kt)("td",{parentName:"tr",align:null},"MS AI SDK for SAP : Demo Program for Model"))))),(0,n.kt)(o.Z,{value:"openai",label:"Open AI",mdxType:"TabItem"},(0,n.kt)("table",null,(0,n.kt)("thead",{parentName:"table"},(0,n.kt)("tr",{parentName:"thead"},(0,n.kt)("th",{parentName:"tr",align:null},"Program Name"),(0,n.kt)("th",{parentName:"tr",align:null},"Package"),(0,n.kt)("th",{parentName:"tr",align:null},"Description"))),(0,n.kt)("tbody",{parentName:"table"},(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"ZP_MSAISDKDEMO_MODELS_OAI")),(0,n.kt)("td",{parentName:"tr",align:null},"ZPENGG_OAI_DEMOS"),(0,n.kt)("td",{parentName:"tr",align:null},"MS AI SDK for SAP : Demo program for Open AI Models")))))),(0,n.kt)("admonition",{type:"tip"},(0,n.kt)("p",{parentName:"admonition"},"Review the demo program along with the content of this page to understand the use of AI SDK feature. The demo program was imported to your SAP Application server as part of AI SDK Installation.")),(0,n.kt)("hr",null),(0,n.kt)("h2",{id:"operations"},"Operations"),(0,n.kt)("table",null,(0,n.kt)("thead",{parentName:"table"},(0,n.kt)("tr",{parentName:"thead"},(0,n.kt)("th",{parentName:"tr",align:null},"Operation"),(0,n.kt)("th",{parentName:"tr",align:null},"Description"))),(0,n.kt)("tbody",{parentName:"table"},(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("a",{parentName:"td",href:"#models---get"},(0,n.kt)("strong",{parentName:"a"},"Get"))),(0,n.kt)("td",{parentName:"tr",align:null},"Gets details for the model specified by the given modelId.")),(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("a",{parentName:"td",href:"#models---list"},(0,n.kt)("strong",{parentName:"a"},"List"))),(0,n.kt)("td",{parentName:"tr",align:null},"Gets a list of all models that are accessible by the AI Engine. These include base models as well as all successfully completed fine-tuned models.")))),(0,n.kt)("hr",null),(0,n.kt)("h3",{id:"models---get"},"Models - Get"),(0,n.kt)("p",null,"Gets details for the model specified by the given modelId."),(0,n.kt)("pre",null,(0,n.kt)("code",{parentName:"pre",className:'language-title="Model',metastring:'- Get"',"-":!0,'Get"':!0},'DATA:  \n  model_get  TYPE zif_peng_azoai_sdk_types=>ty_model_get.   "ABAP Type for A single Model information\n\nsdk_instance->model( )->get(\n        EXPORTING\n          iv_modelid      = model-id            " Model ID\n        IMPORTING\n          ov_statuscode   = status_code         " HTTP status code\n          ov_statusreason = status_reason       " HTTP status description\n          ov_json         = returnjson          " JSON String returned from AI Resource\n          ov_model        = model_get           " Details of the model\n          ov_error        = error               " Error if any.\n      ).\n')),(0,n.kt)("h4",{id:"parameters-and-exceptions"},"Parameters and Exceptions"),(0,n.kt)(l.Z,{mdxType:"Tabs"},(0,n.kt)(o.Z,{value:"params",label:"Parameters",default:!0,mdxType:"TabItem"},(0,n.kt)("table",null,(0,n.kt)("thead",{parentName:"table"},(0,n.kt)("tr",{parentName:"thead"},(0,n.kt)("th",{parentName:"tr",align:null},"Parameter"),(0,n.kt)("th",{parentName:"tr",align:null},"Direction"),(0,n.kt)("th",{parentName:"tr",align:null},"Data Type"),(0,n.kt)("th",{parentName:"tr",align:null},"Description"))),(0,n.kt)("tbody",{parentName:"table"},(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"iv_modelid")),(0,n.kt)("td",{parentName:"tr",align:null},"EXPORTING"),(0,n.kt)("td",{parentName:"tr",align:null},"string"),(0,n.kt)("td",{parentName:"tr",align:null},"The identifier of the model.")),(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"ov_statuscode")),(0,n.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,n.kt)("td",{parentName:"tr",align:null},"Integer"),(0,n.kt)("td",{parentName:"tr",align:null},"Response Code.")),(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"ov_statusreason")),(0,n.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,n.kt)("td",{parentName:"tr",align:null},"String"),(0,n.kt)("td",{parentName:"tr",align:null},"Status Description/Reason")),(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"ov_model")),(0,n.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#model-get"},"Model")),(0,n.kt)("td",{parentName:"tr",align:null},"ABAP ready structure, if operation was successful")),(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"ov_error")),(0,n.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#error"},"Error")),(0,n.kt)("td",{parentName:"tr",align:null},"ABAP Ready error structure, if operation resulted in an error"))))),(0,n.kt)(o.Z,{value:"exception",label:"Exceptions",mdxType:"TabItem"},(0,n.kt)("p",null,(0,n.kt)("strong",{parentName:"p"},"ZCX_PENG_AZOAI_SDK_EXCEPTION")," - Raised if an error occured during processing."),(0,n.kt)("admonition",{type:"caution"},(0,n.kt)("p",{parentName:"admonition"},(0,n.kt)("strong",{parentName:"p"},"The exception is not raised")," if an error occured during AI Engine processing. In such situations, the ",(0,n.kt)("strong",{parentName:"p"},"ov_error")," parameter will provide error details. The exception is raised only if SDK encouters a situation where it cannot proceed with the requested operation.")))),(0,n.kt)("h4",{id:"responsesstatus-code"},"Responses/Status Code"),(0,n.kt)("table",null,(0,n.kt)("thead",{parentName:"table"},(0,n.kt)("tr",{parentName:"thead"},(0,n.kt)("th",{parentName:"tr",align:null},"Name"),(0,n.kt)("th",{parentName:"tr",align:null},"Type"),(0,n.kt)("th",{parentName:"tr",align:null},"Structure Populated"),(0,n.kt)("th",{parentName:"tr",align:null},"Description"))),(0,n.kt)("tbody",{parentName:"table"},(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"200 OK")),(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#model-get"},"Model")),(0,n.kt)("td",{parentName:"tr",align:null},"ov_model"),(0,n.kt)("td",{parentName:"tr",align:null},"Success")),(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"Other Status Codes")),(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#error"},"Error")),(0,n.kt)("td",{parentName:"tr",align:null},"ov_error"),(0,n.kt)("td",{parentName:"tr",align:null},"An error occurred.")))),(0,n.kt)("hr",null),(0,n.kt)("h3",{id:"models---list"},"Models - List"),(0,n.kt)("p",null,"Gets a list of all models that are accessible by the Azure OpenAI resource. These include base models as well as all successfully completed fine-tuned models owned by the Azure OpenAI resource."),(0,n.kt)("pre",null,(0,n.kt)("code",{parentName:"pre",className:'language-title="Model',metastring:'- List"',"-":!0,'List"':!0},'DATA:  \n  model_list TYPE zif_peng_azoai_sdk_types=>ty_model_list.\n\nsdk_instance->model( )->list(\n        IMPORTING\n          ov_statuscode   = status_code   " Status Code\n          ov_statusreason = status_reason " HTTP status description\n          ov_json         = returnjson    " JSON String returned from AI Resource\n          ov_model        = model_list    " List of Models available\n          ov_error        = error         " Error if any\n      ).\n')),(0,n.kt)("h4",{id:"parameters-and-exceptions-1"},"Parameters and Exceptions"),(0,n.kt)(l.Z,{mdxType:"Tabs"},(0,n.kt)(o.Z,{value:"params",label:"Parameters",default:!0,mdxType:"TabItem"},(0,n.kt)("table",null,(0,n.kt)("thead",{parentName:"table"},(0,n.kt)("tr",{parentName:"thead"},(0,n.kt)("th",{parentName:"tr",align:null},"Parameter"),(0,n.kt)("th",{parentName:"tr",align:null},"Direction"),(0,n.kt)("th",{parentName:"tr",align:null},"Data Type"),(0,n.kt)("th",{parentName:"tr",align:null},"Description"))),(0,n.kt)("tbody",{parentName:"table"},(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"ov_statuscode")),(0,n.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,n.kt)("td",{parentName:"tr",align:null},"Integer"),(0,n.kt)("td",{parentName:"tr",align:null},"Response Code.")),(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"ov_statusreason")),(0,n.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,n.kt)("td",{parentName:"tr",align:null},"String"),(0,n.kt)("td",{parentName:"tr",align:null},"Status Description/Reason")),(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"ov_model")),(0,n.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#model-list"},"Model List")),(0,n.kt)("td",{parentName:"tr",align:null},"ABAP ready structure, if operation was successful")),(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"ov_error")),(0,n.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#error"},"Error")),(0,n.kt)("td",{parentName:"tr",align:null},"ABAP Ready error structure, if operation resulted in an error"))))),(0,n.kt)(o.Z,{value:"exception",label:"Exceptions",mdxType:"TabItem"},(0,n.kt)("p",null,(0,n.kt)("strong",{parentName:"p"},"ZCX_PENG_AZOAI_SDK_EXCEPTION")," - Raised if an error occured during processing."),(0,n.kt)("admonition",{type:"caution"},(0,n.kt)("p",{parentName:"admonition"},(0,n.kt)("strong",{parentName:"p"},"The exception is not raised")," if an error occured during AI Engine processing. In such situations, the ",(0,n.kt)("strong",{parentName:"p"},"ov_error")," parameter will provide error details. The exception is raised only if SDK encouters a situation where it cannot proceed with the requested operation.")))),(0,n.kt)("h4",{id:"responsesstatus-code-1"},"Responses/Status Code"),(0,n.kt)("table",null,(0,n.kt)("thead",{parentName:"table"},(0,n.kt)("tr",{parentName:"thead"},(0,n.kt)("th",{parentName:"tr",align:null},"Name"),(0,n.kt)("th",{parentName:"tr",align:null},"Type"),(0,n.kt)("th",{parentName:"tr",align:null},"Structure Populated"),(0,n.kt)("th",{parentName:"tr",align:null},"Description"))),(0,n.kt)("tbody",{parentName:"table"},(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"200 OK")),(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#model-list"},"Model List")),(0,n.kt)("td",{parentName:"tr",align:null},"ov_model"),(0,n.kt)("td",{parentName:"tr",align:null},"Success")),(0,n.kt)("tr",{parentName:"tbody"},(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("strong",{parentName:"td"},"Other Status Codes")),(0,n.kt)("td",{parentName:"tr",align:null},(0,n.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#error"},"Error")),(0,n.kt)("td",{parentName:"tr",align:null},"ov_error"),(0,n.kt)("td",{parentName:"tr",align:null},"An error occurred.")))),(0,n.kt)("hr",null))}g.isMDXComponent=!0},5412:(e,t,a)=>{a.d(t,{ZP:()=>d});var r=a(7462),n=(a(7294),a(3905)),l=a(4866),o=a(5162);const i={toc:[]},s="wrapper";function d(e){let{components:t,...a}=e;return(0,n.kt)(s,(0,r.Z)({},i,a,{components:t,mdxType:"MDXLayout"}),(0,n.kt)("p",null,(0,n.kt)("strong",{parentName:"p"},"AI Engine and Versions"),": "),(0,n.kt)(l.Z,{groupId:"aienginechoice",mdxType:"Tabs"},(0,n.kt)(o.Z,{value:"azoai",label:"Azure Open AI",default:!0,mdxType:"TabItem"},(0,n.kt)("ul",null,(0,n.kt)("li",{parentName:"ul"},(0,n.kt)("strong",{parentName:"li"},"2022-12-01")),(0,n.kt)("li",{parentName:"ul"},(0,n.kt)("strong",{parentName:"li"},"2023-03-15-preview")))),(0,n.kt)(o.Z,{value:"openai",label:"Open AI",mdxType:"TabItem"},(0,n.kt)("ul",null,(0,n.kt)("li",{parentName:"ul"},(0,n.kt)("strong",{parentName:"li"},"v1"))))))}d.isMDXComponent=!0}}]);