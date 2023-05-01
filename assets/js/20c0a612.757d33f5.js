"use strict";(self.webpackChunkaisdkdocumentation=self.webpackChunkaisdkdocumentation||[]).push([[175],{3905:(t,e,a)=>{a.d(e,{Zo:()=>m,kt:()=>N});var n=a(7294);function r(t,e,a){return e in t?Object.defineProperty(t,e,{value:a,enumerable:!0,configurable:!0,writable:!0}):t[e]=a,t}function l(t,e){var a=Object.keys(t);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(t);e&&(n=n.filter((function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable}))),a.push.apply(a,n)}return a}function i(t){for(var e=1;e<arguments.length;e++){var a=null!=arguments[e]?arguments[e]:{};e%2?l(Object(a),!0).forEach((function(e){r(t,e,a[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(a)):l(Object(a)).forEach((function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(a,e))}))}return t}function p(t,e){if(null==t)return{};var a,n,r=function(t,e){if(null==t)return{};var a,n,r={},l=Object.keys(t);for(n=0;n<l.length;n++)a=l[n],e.indexOf(a)>=0||(r[a]=t[a]);return r}(t,e);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(t);for(n=0;n<l.length;n++)a=l[n],e.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(t,a)&&(r[a]=t[a])}return r}var o=n.createContext({}),d=function(t){var e=n.useContext(o),a=e;return t&&(a="function"==typeof t?t(e):i(i({},e),t)),a},m=function(t){var e=d(t.components);return n.createElement(o.Provider,{value:e},t.children)},s="mdxType",k={inlineCode:"code",wrapper:function(t){var e=t.children;return n.createElement(n.Fragment,{},e)}},u=n.forwardRef((function(t,e){var a=t.components,r=t.mdxType,l=t.originalType,o=t.parentName,m=p(t,["components","mdxType","originalType","parentName"]),s=d(a),u=r,N=s["".concat(o,".").concat(u)]||s[u]||k[u]||l;return a?n.createElement(N,i(i({ref:e},m),{},{components:a})):n.createElement(N,i({ref:e},m))}));function N(t,e){var a=arguments,r=e&&e.mdxType;if("string"==typeof t||r){var l=a.length,i=new Array(l);i[0]=u;var p={};for(var o in e)hasOwnProperty.call(e,o)&&(p[o]=e[o]);p.originalType=t,p[s]="string"==typeof t?t:r,i[1]=p;for(var d=2;d<l;d++)i[d]=a[d];return n.createElement.apply(null,i)}return n.createElement.apply(null,a)}u.displayName="MDXCreateElement"},2105:(t,e,a)=>{a.r(e),a.d(e,{assets:()=>o,contentTitle:()=>i,default:()=>k,frontMatter:()=>l,metadata:()=>p,toc:()=>d});var n=a(7462),r=(a(7294),a(3905));const l={sidebar_position:100,title:"Type Definitions",description:"AI SDK Type Definitions.",toc_min_heading_level:2,toc_max_heading_level:5},i="AI SDK Type Definitions",p={unversionedId:"working-with-sdk/type-definitions",id:"working-with-sdk/type-definitions",title:"Type Definitions",description:"AI SDK Type Definitions.",source:"@site/docs/3-working-with-sdk/99-type-definitions.md",sourceDirName:"3-working-with-sdk",slug:"/working-with-sdk/type-definitions",permalink:"/aisdkforsapabap/docs/working-with-sdk/type-definitions",draft:!1,tags:[],version:"current",sidebarPosition:100,frontMatter:{sidebar_position:100,title:"Type Definitions",description:"AI SDK Type Definitions.",toc_min_heading_level:2,toc_max_heading_level:5},sidebar:"tutorialSidebar",previous:{title:"Files",permalink:"/aisdkforsapabap/docs/working-with-sdk/files"}},o={},d=[{value:"Common Types",id:"common-types",level:2},{value:"Error",id:"error",level:3},{value:"Error Code",id:"error-code",level:3},{value:"Models",id:"models",level:2},{value:"Deployments",id:"deployments",level:2},{value:"Deployment Create Info",id:"deployment-create-info",level:3},{value:"Deployment",id:"deployment",level:3},{value:"Deployment List",id:"deployment-list",level:3},{value:"Files",id:"files",level:2},{value:"File",id:"file",level:3},{value:"File Import",id:"file-import",level:3},{value:"File List",id:"file-list",level:3},{value:"File Upload",id:"file-upload",level:3},{value:"Internal Types",id:"internal-types",level:2},{value:"File Statistics",id:"file-statistics",level:3},{value:"Scale Settings",id:"scale-settings",level:3},{value:"Type Discriminator",id:"type-discriminator",level:3},{value:"Purpose",id:"purpose",level:3},{value:"State",id:"state",level:3}],m={toc:d},s="wrapper";function k(t){let{components:e,...a}=t;return(0,r.kt)(s,(0,n.Z)({},m,a,{components:e,mdxType:"MDXLayout"}),(0,r.kt)("h1",{id:"ai-sdk-type-definitions"},"AI SDK Type Definitions"),(0,r.kt)("h2",{id:"common-types"},"Common Types"),(0,r.kt)("h3",{id:"error"},"Error"),(0,r.kt)("admonition",{title:"Type Definition",type:"info"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"zif_peng_azoai_sdk_types=>ty_error"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Field Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"code"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#error-code"},"ErrorCode")),(0,r.kt)("td",{parentName:"tr",align:null},"ErrorCode")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"message"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The message of this error.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"target"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The location where the error happened if available.")))),(0,r.kt)("h3",{id:"error-code"},"Error Code"),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"conflict"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The requested operation conflicts with the current resource state.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"fileImportFailed"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"Import of file failed.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"forbidden"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The operation is forbidden for the current user/api key.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"internalFailure"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"Internal error. Please retry.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"invalidPayload"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The request data is invalid for this operation.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"itemDoesAlreadyExist"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The item does already exist.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"jsonlValidationFailed"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"Validation of jsonl data failed.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"notFound"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The resource is not found.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"quotaExceeded"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"Quota exceeded.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"serviceUnavailable"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The service is currently not available.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"unexpectedEntityState"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The operation cannot be executed in the current resource's state.")))),(0,r.kt)("h2",{id:"models"},"Models"),(0,r.kt)("h2",{id:"deployments"},"Deployments"),(0,r.kt)("h3",{id:"deployment-create-info"},"Deployment Create Info"),(0,r.kt)("admonition",{title:"Type Definition",type:"info"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"zif_peng_azoai_sdk_types=>ty_deployments_create"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Field Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"model"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The OpenAI model identifier (model-id) to deploy. Can be a base model or a fine tune.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"scale_settings"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#scale-settings"},"Scale Settings")),(0,r.kt)("td",{parentName:"tr",align:null},"ScaleSettings.",(0,r.kt)("br",null),"The scale settings of a deployment. It defines the modes for scaling and the reserved capacity.")))),(0,r.kt)("h3",{id:"deployment"},"Deployment"),(0,r.kt)("admonition",{title:"Type Definition",type:"info"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"zif_peng_azoai_sdk_types=>ty_deployments"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Field Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"created_at"),(0,r.kt)("td",{parentName:"tr",align:null},"integer"),(0,r.kt)("td",{parentName:"tr",align:null},"A timestamp when this job or item was created (in unix epochs).")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"error"),(0,r.kt)("td",{parentName:"tr",align:null},"Error"),(0,r.kt)("td",{parentName:"tr",align:null},"Error Information")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"id"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The identity of this item.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"model"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The OpenAI model identifier (model-id) to deploy. Can be a base model or a fine tune.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"object"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#type-discriminator"},"TypeDiscriminator")),(0,r.kt)("td",{parentName:"tr",align:null},"Type of the object.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"owner"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},'The owner of this deployment. For Azure OpenAI only "organization-owner" is supported.')),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"scale_settings"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#scale-settings"},"Scale Settings")),(0,r.kt)("td",{parentName:"tr",align:null},"ScaleSettings.",(0,r.kt)("br",null),"The scale settings of a deployment. It defines the modes for scaling and the reserved capacity.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"status"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#state"},"State")),(0,r.kt)("td",{parentName:"tr",align:null},"State.",(0,r.kt)("br",null),"The state of a job or item.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"updated_at"),(0,r.kt)("td",{parentName:"tr",align:null},"integer"),(0,r.kt)("td",{parentName:"tr",align:null},"A timestamp when this job or item was modified last (in unix epochs).")))),(0,r.kt)("h3",{id:"deployment-list"},"Deployment List"),(0,r.kt)("admonition",{title:"Type Definition",type:"info"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"zif_peng_azoai_sdk_types=>ty_deployments_list"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Field Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"data"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#deployment"},"Deployment"),"[]"),(0,r.kt)("td",{parentName:"tr",align:null},"Internal Table of Deployment")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"object"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#type-discriminator"},"Type Discriminator")),(0,r.kt)("td",{parentName:"tr",align:null},"Defines the type of an object.")))),(0,r.kt)("h2",{id:"files"},"Files"),(0,r.kt)("h3",{id:"file"},"File"),(0,r.kt)("admonition",{title:"Type Definition",type:"info"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"zif_peng_azoai_sdk_types=>ty_file_get"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Field Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"bytes"),(0,r.kt)("td",{parentName:"tr",align:null},"integer"),(0,r.kt)("td",{parentName:"tr",align:null},"The size of this file when available (can be null).")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"created_at"),(0,r.kt)("td",{parentName:"tr",align:null},"integer"),(0,r.kt)("td",{parentName:"tr",align:null},"A timestamp when this job or item was created (in unix epochs).")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"error"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#error"},"Error")),(0,r.kt)("td",{parentName:"tr",align:null},"Error")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"filename"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The name of the file.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"id"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The identity of this item.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"object"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#type-discriminator"},"Type Discriminator")),(0,r.kt)("td",{parentName:"tr",align:null},"Defines the type of an object.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"purpose"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#purpose"},"Purpose")),(0,r.kt)("td",{parentName:"tr",align:null},"Purpose",(0,r.kt)("br",null),'The intended purpose of the uploaded documents. Use "fine-tune" for fine-tuning. This allows validation of format of the uploaded file.')),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"statistics"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#file-statistics"},"File Statistics")),(0,r.kt)("td",{parentName:"tr",align:null},"FileStatistics",(0,r.kt)("br",null),"A file is a document usable for training and validation. It can also be a service generated document with result details.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"status"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#state"},"State")),(0,r.kt)("td",{parentName:"tr",align:null},"State",(0,r.kt)("br",null),"The state of a job or item.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"updated_at"),(0,r.kt)("td",{parentName:"tr",align:null},"integer"),(0,r.kt)("td",{parentName:"tr",align:null},"A timestamp when this job or item was modified last (in unix epochs).")))),(0,r.kt)("h3",{id:"file-import"},"File Import"),(0,r.kt)("admonition",{title:"Type Definition",type:"info"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"zif_peng_azoai_sdk_types=>ty_file_import"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Field Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"content_url"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The url to download the document from (can be SAS url of a blob or any other external url accessible with a GET request).")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"filename"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"The name of the ",(0,r.kt)("a",{parentName:"td",href:"https://jsonlines.readthedocs.io/en/latest/"},"JSON Lines"),' file to be uploaded. If the purpose is set to "fine-tune", each line is a JSON record with "prompt" and "completion" fields representing your training examples.')),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"purpose"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#purpose"},"Purpose")),(0,r.kt)("td",{parentName:"tr",align:null},"Purpose.",(0,r.kt)("br",null),'The intended purpose of the uploaded documents. Use "fine-tune" for fine-tuning.')))),(0,r.kt)("h3",{id:"file-list"},"File List"),(0,r.kt)("admonition",{title:"Type Definition",type:"info"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"zif_peng_azoai_sdk_types=>ty_file_list"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Field Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"data"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#file"},"File"),"[]"),(0,r.kt)("td",{parentName:"tr",align:null},"The list of items.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"object"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"#type-discriminator"},"Type Discriminator")),(0,r.kt)("td",{parentName:"tr",align:null},"Defines the type of an object.")))),(0,r.kt)("h3",{id:"file-upload"},"File Upload"),(0,r.kt)("admonition",{title:"Type Definition",type:"info"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"zif_peng_azoai_sdk_typinternal=>ty_int_file_upload"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Field Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"prompt"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"Training Data Prompt")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"completion"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"Training Data Completion.")))),(0,r.kt)("h2",{id:"internal-types"},"Internal Types"),(0,r.kt)("p",null,"The following are internal types of AI SDK, and chances are, you wont be declaring these types in your use cases or ABAP programs. However, you will still come across these as fields in other exposed data types."),(0,r.kt)("h3",{id:"file-statistics"},"File Statistics"),(0,r.kt)("admonition",{title:"Type Definition",type:"note"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"zif_peng_azoai_sdk_typinternal=>ty_int_file_stats"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Field Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"examples"),(0,r.kt)("td",{parentName:"tr",align:null},"integer"),(0,r.kt)("td",{parentName:"tr",align:null},'The number of contained training examples in files of kind "fine-tune" once validation of file content is complete.')),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"tokens"),(0,r.kt)("td",{parentName:"tr",align:null},"integer"),(0,r.kt)("td",{parentName:"tr",align:null},'The number of tokens used in prompts and completions for files of kind "fine-tune" once validation of file content is complete.')))),(0,r.kt)("h3",{id:"scale-settings"},"Scale Settings"),(0,r.kt)("admonition",{title:"Type Definition",type:"note"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"zif_peng_azoai_sdk_typinternal=>ty_scale_settings"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Field Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"capacity"),(0,r.kt)("td",{parentName:"tr",align:null},"Integer"),(0,r.kt)("td",{parentName:"tr",align:null},"The constant reserved capacity of the inference endpoint for this deployment.",(0,r.kt)("br",null),(0,r.kt)("em",{parentName:"td"},"Only used when scale_type is manual"))),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"scale_type"),(0,r.kt)("td",{parentName:"tr",align:null},"String",(0,r.kt)("br",null),(0,r.kt)("ul",null,(0,r.kt)("li",null,(0,r.kt)("em",{parentName:"td"},"manual")),(0,r.kt)("li",null,(0,r.kt)("em",{parentName:"td"},"standard")))),(0,r.kt)("td",{parentName:"tr",align:null},"Defines how scaling operations will be executed.",(0,r.kt)("br",null),"If set to ",(0,r.kt)("strong",{parentName:"td"},(0,r.kt)("em",{parentName:"strong"},"manual")),", capacity must be specified.")))),(0,r.kt)("h3",{id:"type-discriminator"},"Type Discriminator"),(0,r.kt)("admonition",{title:"Type Definition",type:"note"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"string"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Value"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"model"),(0,r.kt)("td",{parentName:"tr",align:null},"This object represents a model (can be a base models or fine tune job result).")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"deployment"),(0,r.kt)("td",{parentName:"tr",align:null},"This object represents a deployment.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"file"),(0,r.kt)("td",{parentName:"tr",align:null},"This object represents a file.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"fine-tune"),(0,r.kt)("td",{parentName:"tr",align:null},"This object represents a fine tune job.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"fine-tune-event"),(0,r.kt)("td",{parentName:"tr",align:null},"This object represents an event of a fine tune job.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"list"),(0,r.kt)("td",{parentName:"tr",align:null},"This object represents a list of other objects.")))),(0,r.kt)("h3",{id:"purpose"},"Purpose"),(0,r.kt)("admonition",{title:"Type Definition",type:"note"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"string"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Value"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"fine-tune"),(0,r.kt)("td",{parentName:"tr",align:null},"This file contains training data for a fine tune job.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"fine-tune-results"),(0,r.kt)("td",{parentName:"tr",align:null},"This file contains the results of a fine tune job.")))),(0,r.kt)("h3",{id:"state"},"State"),(0,r.kt)("admonition",{title:"Type Definition",type:"note"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"string"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Value"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"canceled"),(0,r.kt)("td",{parentName:"tr",align:null},"The operation has been canceled and is incomplete.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"deleted"),(0,r.kt)("td",{parentName:"tr",align:null},"The entity has been deleted but may still be referenced by other entities predating the deletion.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"failed"),(0,r.kt)("td",{parentName:"tr",align:null},"The operation has completed processing with a failure and cannot be further consumed.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"notRunning"),(0,r.kt)("td",{parentName:"tr",align:null},"The operation was created and is not queued to be processed in the future.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"running"),(0,r.kt)("td",{parentName:"tr",align:null},"The operation has started to be processed.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"succeeded"),(0,r.kt)("td",{parentName:"tr",align:null},"The operation has successfully be processed and is ready for consumption.")))))}k.isMDXComponent=!0}}]);