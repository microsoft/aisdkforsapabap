"use strict";(self.webpackChunkaisdkdocumentation=self.webpackChunkaisdkdocumentation||[]).push([[48],{3905:(t,e,a)=>{a.d(e,{Zo:()=>u,kt:()=>k});var n=a(7294);function r(t,e,a){return e in t?Object.defineProperty(t,e,{value:a,enumerable:!0,configurable:!0,writable:!0}):t[e]=a,t}function o(t,e){var a=Object.keys(t);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(t);e&&(n=n.filter((function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable}))),a.push.apply(a,n)}return a}function l(t){for(var e=1;e<arguments.length;e++){var a=null!=arguments[e]?arguments[e]:{};e%2?o(Object(a),!0).forEach((function(e){r(t,e,a[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(a)):o(Object(a)).forEach((function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(a,e))}))}return t}function i(t,e){if(null==t)return{};var a,n,r=function(t,e){if(null==t)return{};var a,n,r={},o=Object.keys(t);for(n=0;n<o.length;n++)a=o[n],e.indexOf(a)>=0||(r[a]=t[a]);return r}(t,e);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(t);for(n=0;n<o.length;n++)a=o[n],e.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(t,a)&&(r[a]=t[a])}return r}var s=n.createContext({}),p=function(t){var e=n.useContext(s),a=e;return t&&(a="function"==typeof t?t(e):l(l({},e),t)),a},u=function(t){var e=p(t.components);return n.createElement(s.Provider,{value:e},t.children)},m="mdxType",d={inlineCode:"code",wrapper:function(t){var e=t.children;return n.createElement(n.Fragment,{},e)}},c=n.forwardRef((function(t,e){var a=t.components,r=t.mdxType,o=t.originalType,s=t.parentName,u=i(t,["components","mdxType","originalType","parentName"]),m=p(a),c=r,k=m["".concat(s,".").concat(c)]||m[c]||d[c]||o;return a?n.createElement(k,l(l({ref:e},u),{},{components:a})):n.createElement(k,l({ref:e},u))}));function k(t,e){var a=arguments,r=e&&e.mdxType;if("string"==typeof t||r){var o=a.length,l=new Array(o);l[0]=c;var i={};for(var s in e)hasOwnProperty.call(e,s)&&(i[s]=e[s]);i.originalType=t,i[m]="string"==typeof t?t:r,l[1]=i;for(var p=2;p<o;p++)l[p]=a[p];return n.createElement.apply(null,l)}return n.createElement.apply(null,a)}c.displayName="MDXCreateElement"},5162:(t,e,a)=>{a.d(e,{Z:()=>l});var n=a(7294),r=a(6010);const o={tabItem:"tabItem_Ymn6"};function l(t){let{children:e,hidden:a,className:l}=t;return n.createElement("div",{role:"tabpanel",className:(0,r.Z)(o.tabItem,l),hidden:a},e)}},4866:(t,e,a)=>{a.d(e,{Z:()=>v});var n=a(7462),r=a(7294),o=a(6010),l=a(2466),i=a(6550),s=a(1980),p=a(7392),u=a(12);function m(t){return function(t){return r.Children.map(t,(t=>{if(!t||(0,r.isValidElement)(t)&&function(t){const{props:e}=t;return!!e&&"object"==typeof e&&"value"in e}(t))return t;throw new Error(`Docusaurus error: Bad <Tabs> child <${"string"==typeof t.type?t.type:t.type.name}>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.`)}))?.filter(Boolean)??[]}(t).map((t=>{let{props:{value:e,label:a,attributes:n,default:r}}=t;return{value:e,label:a,attributes:n,default:r}}))}function d(t){const{values:e,children:a}=t;return(0,r.useMemo)((()=>{const t=e??m(a);return function(t){const e=(0,p.l)(t,((t,e)=>t.value===e.value));if(e.length>0)throw new Error(`Docusaurus error: Duplicate values "${e.map((t=>t.value)).join(", ")}" found in <Tabs>. Every value needs to be unique.`)}(t),t}),[e,a])}function c(t){let{value:e,tabValues:a}=t;return a.some((t=>t.value===e))}function k(t){let{queryString:e=!1,groupId:a}=t;const n=(0,i.k6)(),o=function(t){let{queryString:e=!1,groupId:a}=t;if("string"==typeof e)return e;if(!1===e)return null;if(!0===e&&!a)throw new Error('Docusaurus error: The <Tabs> component groupId prop is required if queryString=true, because this value is used as the search param name. You can also provide an explicit value such as queryString="my-search-param".');return a??null}({queryString:e,groupId:a});return[(0,s._X)(o),(0,r.useCallback)((t=>{if(!o)return;const e=new URLSearchParams(n.location.search);e.set(o,t),n.replace({...n.location,search:e.toString()})}),[o,n])]}function g(t){const{defaultValue:e,queryString:a=!1,groupId:n}=t,o=d(t),[l,i]=(0,r.useState)((()=>function(t){let{defaultValue:e,tabValues:a}=t;if(0===a.length)throw new Error("Docusaurus error: the <Tabs> component requires at least one <TabItem> children component");if(e){if(!c({value:e,tabValues:a}))throw new Error(`Docusaurus error: The <Tabs> has a defaultValue "${e}" but none of its children has the corresponding value. Available values are: ${a.map((t=>t.value)).join(", ")}. If you intend to show no default tab, use defaultValue={null} instead.`);return e}const n=a.find((t=>t.default))??a[0];if(!n)throw new Error("Unexpected error: 0 tabValues");return n.value}({defaultValue:e,tabValues:o}))),[s,p]=k({queryString:a,groupId:n}),[m,g]=function(t){let{groupId:e}=t;const a=function(t){return t?`docusaurus.tab.${t}`:null}(e),[n,o]=(0,u.Nk)(a);return[n,(0,r.useCallback)((t=>{a&&o.set(t)}),[a,o])]}({groupId:n}),h=(()=>{const t=s??m;return c({value:t,tabValues:o})?t:null})();(0,r.useLayoutEffect)((()=>{h&&i(h)}),[h]);return{selectedValue:l,selectValue:(0,r.useCallback)((t=>{if(!c({value:t,tabValues:o}))throw new Error(`Can't select invalid tab value=${t}`);i(t),p(t),g(t)}),[p,g,o]),tabValues:o}}var h=a(2389);const N={tabList:"tabList__CuJ",tabItem:"tabItem_LNqP"};function b(t){let{className:e,block:a,selectedValue:i,selectValue:s,tabValues:p}=t;const u=[],{blockElementScrollPositionUntilNextRender:m}=(0,l.o5)(),d=t=>{const e=t.currentTarget,a=u.indexOf(e),n=p[a].value;n!==i&&(m(e),s(n))},c=t=>{let e=null;switch(t.key){case"Enter":d(t);break;case"ArrowRight":{const a=u.indexOf(t.currentTarget)+1;e=u[a]??u[0];break}case"ArrowLeft":{const a=u.indexOf(t.currentTarget)-1;e=u[a]??u[u.length-1];break}}e?.focus()};return r.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,o.Z)("tabs",{"tabs--block":a},e)},p.map((t=>{let{value:e,label:a,attributes:l}=t;return r.createElement("li",(0,n.Z)({role:"tab",tabIndex:i===e?0:-1,"aria-selected":i===e,key:e,ref:t=>u.push(t),onKeyDown:c,onClick:d},l,{className:(0,o.Z)("tabs__item",N.tabItem,l?.className,{"tabs__item--active":i===e})}),a??e)})))}function f(t){let{lazy:e,children:a,selectedValue:n}=t;const o=(Array.isArray(a)?a:[a]).filter(Boolean);if(e){const t=o.find((t=>t.props.value===n));return t?(0,r.cloneElement)(t,{className:"margin-top--md"}):null}return r.createElement("div",{className:"margin-top--md"},o.map(((t,e)=>(0,r.cloneElement)(t,{key:e,hidden:t.props.value!==n}))))}function y(t){const e=g(t);return r.createElement("div",{className:(0,o.Z)("tabs-container",N.tabList)},r.createElement(b,(0,n.Z)({},t,e)),r.createElement(f,(0,n.Z)({},t,e)))}function v(t){const e=(0,h.Z)();return r.createElement(y,(0,n.Z)({key:String(e)},t))}},7151:(t,e,a)=>{a.r(e),a.d(e,{assets:()=>u,contentTitle:()=>s,default:()=>k,frontMatter:()=>i,metadata:()=>p,toc:()=>m});var n=a(7462),r=(a(7294),a(3905)),o=a(4866),l=a(5162);const i={sidebar_position:6,title:"Chat Completions (GPT4)",description:"Working with completions using AI SDK.",toc_min_heading_level:2,toc_max_heading_level:5},s=void 0,p={unversionedId:"working-with-sdk/chat_completions",id:"working-with-sdk/chat_completions",title:"Chat Completions (GPT4)",description:"Working with completions using AI SDK.",source:"@site/docs/3-working-with-sdk/7_chat_completions.mdx",sourceDirName:"3-working-with-sdk",slug:"/working-with-sdk/chat_completions",permalink:"/aisdkforsapabap/docs/working-with-sdk/chat_completions",draft:!1,tags:[],version:"current",sidebarPosition:6,frontMatter:{sidebar_position:6,title:"Chat Completions (GPT4)",description:"Working with completions using AI SDK.",toc_min_heading_level:2,toc_max_heading_level:5},sidebar:"tutorialSidebar",previous:{title:"Completions (GPT3)",permalink:"/aisdkforsapabap/docs/working-with-sdk/completions"},next:{title:"Type Definitions",permalink:"/aisdkforsapabap/docs/working-with-sdk/type-definitions"}},u={},m=[{value:"Demo Program",id:"demo-program",level:2},{value:"Operations",id:"operations",level:2},{value:"Using Chat Completion",id:"using-chat-completion",level:2},{value:"Chat Completions - Create",id:"chat-completions---create",level:3},{value:"Parameters and Exceptions",id:"parameters-and-exceptions",level:4},{value:"Responses/Status Code",id:"responsesstatus-code",level:4}],d={toc:m},c="wrapper";function k(t){let{components:e,...a}=t;return(0,r.kt)(c,(0,n.Z)({},d,a,{components:e,mdxType:"MDXLayout"}),(0,r.kt)("admonition",{type:"info"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"Chat Completion is used along with GPT4 models/deployments"),". If you are looking for GPT3 model usage through AI SDK, please refer to ",(0,r.kt)("strong",{parentName:"p"},(0,r.kt)("a",{parentName:"strong",href:"/aisdkforsapabap/docs/working-with-sdk/completions"},"Completions")),".")),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"AI Engine and Versions"),":"),(0,r.kt)(o.Z,{groupId:"aienginechoice",mdxType:"Tabs"},(0,r.kt)(l.Z,{value:"azoai",label:"Azure Open AI",default:!0,mdxType:"TabItem"},(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("strong",{parentName:"li"},"2023-03-15-preview")))),(0,r.kt)(l.Z,{value:"openai",label:"Open AI",mdxType:"TabItem"},(0,r.kt)("admonition",{title:"Coming Soon!",type:"info"},(0,r.kt)("p",{parentName:"admonition"},"AI SDK support for Open AI coming soon.")))),(0,r.kt)("h2",{id:"demo-program"},"Demo Program"),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Program Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Package"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"ZP_AISDKDEMO_CHATCOMPL_SIMPLE")),(0,r.kt)("td",{parentName:"tr",align:null},"ZPENGG_AZOAI_SDK_DEMOS"),(0,r.kt)("td",{parentName:"tr",align:null},"MSPENG: AI SDK Demo programs - Chat Completions - Simple")))),(0,r.kt)("admonition",{type:"tip"},(0,r.kt)("p",{parentName:"admonition"},"Review the demo program along with the content of this page to understand the use of AI SDK feature. The demo program was imported to your SAP Application server as part of AI SDK Installation.")),(0,r.kt)("h2",{id:"operations"},"Operations"),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Operation"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},(0,r.kt)("a",{parentName:"strong",href:"#chat-completions---create"},"Create"))),(0,r.kt)("td",{parentName:"tr",align:null},"With the Completions operation, the model will generate one or more predicted completions based on a provided prompt. The service can also return the probabilities of alternative tokens at each position.")))),(0,r.kt)("h2",{id:"using-chat-completion"},"Using Chat Completion"),(0,r.kt)("admonition",{type:"important"},(0,r.kt)("p",{parentName:"admonition"},"Chat completion only works with deployments of following models:"),(0,r.kt)("table",{parentName:"admonition"},(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Model ID"),(0,r.kt)("th",{parentName:"tr",align:null},"Base Model Regions"),(0,r.kt)("th",{parentName:"tr",align:null},"Max Request (tokens)"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"gpt-35-turbo")),(0,r.kt)("td",{parentName:"tr",align:null},"East US, South Central US, West Europe"),(0,r.kt)("td",{parentName:"tr",align:null},"4096")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"gpt-4")),(0,r.kt)("td",{parentName:"tr",align:null},"East US, South Central US"),(0,r.kt)("td",{parentName:"tr",align:null},"8,192")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"gpt-4-32k")),(0,r.kt)("td",{parentName:"tr",align:null},"East US, South Central US"),(0,r.kt)("td",{parentName:"tr",align:null},"32,768"))))),(0,r.kt)("p",null,"TODO : ",(0,r.kt)("a",{parentName:"p",href:"https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/chatgpt?pivots=programming-language-chat-completions#model-versioning"},"https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/chatgpt?pivots=programming-language-chat-completions#model-versioning")),(0,r.kt)("h3",{id:"chat-completions---create"},"Chat Completions - Create"),(0,r.kt)("p",null,"With the Chat Completions operation, the model will generate one or more predicted completions based on a provided prompt. The service can also return the probabilities of alternative tokens at each position."),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:'language-title="Chat',metastring:'Completions - Create"',Completions:!0,"-":!0,'Create"':!0},"DATA:\n  chatcompl_input  TYPE zif_peng_azoai_sdk_types=>ty_chatcompletion_input,\n  chatcompl_output TYPE zif_peng_azoai_sdk_types=>ty_chatcompletion_output.\n\n\n      sdk_instance->chat_completions( )->create(\n        EXPORTING\n          deploymentid = deployment_id\n          prompts      = chatcompl_input\n        IMPORTING\n          statuscode   = status_code      \n          statusreason = status_reason    \n          response     = chatcompl_output\n          error        = error            \n      ).\n")),(0,r.kt)("h4",{id:"parameters-and-exceptions"},"Parameters and Exceptions"),(0,r.kt)(o.Z,{mdxType:"Tabs"},(0,r.kt)(l.Z,{value:"params",label:"Parameters",default:!0,mdxType:"TabItem"},(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Parameter"),(0,r.kt)("th",{parentName:"tr",align:null},"Direction"),(0,r.kt)("th",{parentName:"tr",align:null},"Data Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"deploymentid")),(0,r.kt)("td",{parentName:"tr",align:null},"EXPORTING"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"Deployment ID on which this completion must be run")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"prompts")),(0,r.kt)("td",{parentName:"tr",align:null},"EXPORTING"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#chat-completion-input"},"Chat Completions Input")),(0,r.kt)("td",{parentName:"tr",align:null},"Messages organized by role (system/user/assistant)")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"statuscode")),(0,r.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,r.kt)("td",{parentName:"tr",align:null},"Integer"),(0,r.kt)("td",{parentName:"tr",align:null},"Response Code.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"statusreason")),(0,r.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,r.kt)("td",{parentName:"tr",align:null},"String"),(0,r.kt)("td",{parentName:"tr",align:null},"Status Description/Reason")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"response")),(0,r.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#chat-completion-output"},"Chat Completions Output")),(0,r.kt)("td",{parentName:"tr",align:null},"ABAP Ready chat completion result.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"error")),(0,r.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#error"},"Error")),(0,r.kt)("td",{parentName:"tr",align:null},"ABAP Ready error structure, if operation resulted in an error"))))),(0,r.kt)(l.Z,{value:"exception",label:"Exceptions",mdxType:"TabItem"},(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"ZCX_PENG_AZOAI_SDK_EXCEPTION")," - Raised if an error occured during processing."),(0,r.kt)("admonition",{type:"caution"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"The exception is not raised")," if an error occured during AI Engine processing. In such situations, the ",(0,r.kt)("strong",{parentName:"p"},"ov_error")," parameter will provide error details. The exception is raised only if SDK encouters a situation where it cannot proceed with the requested operation.")))),(0,r.kt)("h4",{id:"responsesstatus-code"},"Responses/Status Code"),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Structure Populated"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"200 OK")),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#chat-completion-output"},"Chat Completions Output")),(0,r.kt)("td",{parentName:"tr",align:null},"response"),(0,r.kt)("td",{parentName:"tr",align:null},"Success")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"Other Status Codes")),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#error"},"Error")),(0,r.kt)("td",{parentName:"tr",align:null},"error"),(0,r.kt)("td",{parentName:"tr",align:null},"An error occurred.")))))}k.isMDXComponent=!0}}]);