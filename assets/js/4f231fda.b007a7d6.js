"use strict";(self.webpackChunkaisdkdocumentation=self.webpackChunkaisdkdocumentation||[]).push([[151],{3905:(e,t,a)=>{a.d(t,{Zo:()=>u,kt:()=>k});var n=a(7294);function r(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}function o(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,n)}return a}function l(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?o(Object(a),!0).forEach((function(t){r(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):o(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function i(e,t){if(null==e)return{};var a,n,r=function(e,t){if(null==e)return{};var a,n,r={},o=Object.keys(e);for(n=0;n<o.length;n++)a=o[n],t.indexOf(a)>=0||(r[a]=e[a]);return r}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(n=0;n<o.length;n++)a=o[n],t.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(e,a)&&(r[a]=e[a])}return r}var s=n.createContext({}),p=function(e){var t=n.useContext(s),a=t;return e&&(a="function"==typeof e?e(t):l(l({},t),e)),a},u=function(e){var t=p(e.components);return n.createElement(s.Provider,{value:t},e.children)},m="mdxType",d={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},c=n.forwardRef((function(e,t){var a=e.components,r=e.mdxType,o=e.originalType,s=e.parentName,u=i(e,["components","mdxType","originalType","parentName"]),m=p(a),c=r,k=m["".concat(s,".").concat(c)]||m[c]||d[c]||o;return a?n.createElement(k,l(l({ref:t},u),{},{components:a})):n.createElement(k,l({ref:t},u))}));function k(e,t){var a=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var o=a.length,l=new Array(o);l[0]=c;var i={};for(var s in t)hasOwnProperty.call(t,s)&&(i[s]=t[s]);i.originalType=e,i[m]="string"==typeof e?e:r,l[1]=i;for(var p=2;p<o;p++)l[p]=a[p];return n.createElement.apply(null,l)}return n.createElement.apply(null,a)}c.displayName="MDXCreateElement"},5162:(e,t,a)=>{a.d(t,{Z:()=>l});var n=a(7294),r=a(6010);const o={tabItem:"tabItem_Ymn6"};function l(e){let{children:t,hidden:a,className:l}=e;return n.createElement("div",{role:"tabpanel",className:(0,r.Z)(o.tabItem,l),hidden:a},t)}},4866:(e,t,a)=>{a.d(t,{Z:()=>v});var n=a(7462),r=a(7294),o=a(6010),l=a(2466),i=a(6550),s=a(1980),p=a(7392),u=a(12);function m(e){return function(e){return r.Children.map(e,(e=>{if(!e||(0,r.isValidElement)(e)&&function(e){const{props:t}=e;return!!t&&"object"==typeof t&&"value"in t}(e))return e;throw new Error(`Docusaurus error: Bad <Tabs> child <${"string"==typeof e.type?e.type:e.type.name}>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.`)}))?.filter(Boolean)??[]}(e).map((e=>{let{props:{value:t,label:a,attributes:n,default:r}}=e;return{value:t,label:a,attributes:n,default:r}}))}function d(e){const{values:t,children:a}=e;return(0,r.useMemo)((()=>{const e=t??m(a);return function(e){const t=(0,p.l)(e,((e,t)=>e.value===t.value));if(t.length>0)throw new Error(`Docusaurus error: Duplicate values "${t.map((e=>e.value)).join(", ")}" found in <Tabs>. Every value needs to be unique.`)}(e),e}),[t,a])}function c(e){let{value:t,tabValues:a}=e;return a.some((e=>e.value===t))}function k(e){let{queryString:t=!1,groupId:a}=e;const n=(0,i.k6)(),o=function(e){let{queryString:t=!1,groupId:a}=e;if("string"==typeof t)return t;if(!1===t)return null;if(!0===t&&!a)throw new Error('Docusaurus error: The <Tabs> component groupId prop is required if queryString=true, because this value is used as the search param name. You can also provide an explicit value such as queryString="my-search-param".');return a??null}({queryString:t,groupId:a});return[(0,s._X)(o),(0,r.useCallback)((e=>{if(!o)return;const t=new URLSearchParams(n.location.search);t.set(o,e),n.replace({...n.location,search:t.toString()})}),[o,n])]}function g(e){const{defaultValue:t,queryString:a=!1,groupId:n}=e,o=d(e),[l,i]=(0,r.useState)((()=>function(e){let{defaultValue:t,tabValues:a}=e;if(0===a.length)throw new Error("Docusaurus error: the <Tabs> component requires at least one <TabItem> children component");if(t){if(!c({value:t,tabValues:a}))throw new Error(`Docusaurus error: The <Tabs> has a defaultValue "${t}" but none of its children has the corresponding value. Available values are: ${a.map((e=>e.value)).join(", ")}. If you intend to show no default tab, use defaultValue={null} instead.`);return t}const n=a.find((e=>e.default))??a[0];if(!n)throw new Error("Unexpected error: 0 tabValues");return n.value}({defaultValue:t,tabValues:o}))),[s,p]=k({queryString:a,groupId:n}),[m,g]=function(e){let{groupId:t}=e;const a=function(e){return e?`docusaurus.tab.${e}`:null}(t),[n,o]=(0,u.Nk)(a);return[n,(0,r.useCallback)((e=>{a&&o.set(e)}),[a,o])]}({groupId:n}),h=(()=>{const e=s??m;return c({value:e,tabValues:o})?e:null})();(0,r.useLayoutEffect)((()=>{h&&i(h)}),[h]);return{selectedValue:l,selectValue:(0,r.useCallback)((e=>{if(!c({value:e,tabValues:o}))throw new Error(`Can't select invalid tab value=${e}`);i(e),p(e),g(e)}),[p,g,o]),tabValues:o}}var h=a(2389);const N={tabList:"tabList__CuJ",tabItem:"tabItem_LNqP"};function b(e){let{className:t,block:a,selectedValue:i,selectValue:s,tabValues:p}=e;const u=[],{blockElementScrollPositionUntilNextRender:m}=(0,l.o5)(),d=e=>{const t=e.currentTarget,a=u.indexOf(t),n=p[a].value;n!==i&&(m(t),s(n))},c=e=>{let t=null;switch(e.key){case"Enter":d(e);break;case"ArrowRight":{const a=u.indexOf(e.currentTarget)+1;t=u[a]??u[0];break}case"ArrowLeft":{const a=u.indexOf(e.currentTarget)-1;t=u[a]??u[u.length-1];break}}t?.focus()};return r.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,o.Z)("tabs",{"tabs--block":a},t)},p.map((e=>{let{value:t,label:a,attributes:l}=e;return r.createElement("li",(0,n.Z)({role:"tab",tabIndex:i===t?0:-1,"aria-selected":i===t,key:t,ref:e=>u.push(e),onKeyDown:c,onClick:d},l,{className:(0,o.Z)("tabs__item",N.tabItem,l?.className,{"tabs__item--active":i===t})}),a??t)})))}function f(e){let{lazy:t,children:a,selectedValue:n}=e;const o=(Array.isArray(a)?a:[a]).filter(Boolean);if(t){const e=o.find((e=>e.props.value===n));return e?(0,r.cloneElement)(e,{className:"margin-top--md"}):null}return r.createElement("div",{className:"margin-top--md"},o.map(((e,t)=>(0,r.cloneElement)(e,{key:t,hidden:e.props.value!==n}))))}function y(e){const t=g(e);return r.createElement("div",{className:(0,o.Z)("tabs-container",N.tabList)},r.createElement(b,(0,n.Z)({},e,t)),r.createElement(f,(0,n.Z)({},e,t)))}function v(e){const t=(0,h.Z)();return r.createElement(y,(0,n.Z)({key:String(t)},e))}},2930:(e,t,a)=>{a.r(t),a.d(t,{assets:()=>m,contentTitle:()=>p,default:()=>g,frontMatter:()=>s,metadata:()=>u,toc:()=>d});var n=a(7462),r=(a(7294),a(3905)),o=a(4866),l=a(5162),i=a(5412);const s={sidebar_position:7,title:"Completions (GPT3)",description:"Working with completions using AI SDK.",toc_min_heading_level:2,toc_max_heading_level:5},p="AI SDK for SAP Completions Overview",u={unversionedId:"working-with-sdk/completions",id:"working-with-sdk/completions",title:"Completions (GPT3)",description:"Working with completions using AI SDK.",source:"@site/docs/3-working-with-sdk/7_completions.mdx",sourceDirName:"3-working-with-sdk",slug:"/working-with-sdk/completions",permalink:"/aisdkforsapabap/docs/working-with-sdk/completions",draft:!1,tags:[],version:"current",sidebarPosition:7,frontMatter:{sidebar_position:7,title:"Completions (GPT3)",description:"Working with completions using AI SDK.",toc_min_heading_level:2,toc_max_heading_level:5},sidebar:"tutorialSidebar",previous:{title:"Embeddings",permalink:"/aisdkforsapabap/docs/working-with-sdk/embeddings"},next:{title:"Chat Completions (GPT4)",permalink:"/aisdkforsapabap/docs/working-with-sdk/chat_completions"}},m={},d=[{value:"Demo Program",id:"demo-program",level:2},{value:"Operations",id:"operations",level:2},{value:"Completions - Create",id:"completions---create",level:3},{value:"Parameters and Exceptions",id:"parameters-and-exceptions",level:4},{value:"Responses/Status Code",id:"responsesstatus-code",level:4}],c={toc:d},k="wrapper";function g(e){let{components:t,...a}=e;return(0,r.kt)(k,(0,n.Z)({},c,a,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("h1",{id:"ai-sdk-for-sap-completions-overview"},"AI SDK for SAP Completions Overview"),(0,r.kt)("admonition",{type:"info"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"Completions is used along with GPT3 models/deployments"),". If you are looking for latest GPT4 model usage through AI SDK, please refer to ",(0,r.kt)("strong",{parentName:"p"},(0,r.kt)("a",{parentName:"strong",href:"/aisdkforsapabap/docs/working-with-sdk/chat_completions"},"Chat Completions")),".")),(0,r.kt)(i.ZP,{mdxType:"AiEngineAndVersion"}),(0,r.kt)("h2",{id:"demo-program"},"Demo Program"),(0,r.kt)(o.Z,{groupId:"aienginechoice",mdxType:"Tabs"},(0,r.kt)(l.Z,{value:"azoai",label:"Azure Open AI",default:!0,mdxType:"TabItem"},(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Program Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Package"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"ZP_PENGG_AZOAI_DEMO_COMPLETION")),(0,r.kt)("td",{parentName:"tr",align:null},"ZPENGG_AZOAI_SDK_DEMOS"),(0,r.kt)("td",{parentName:"tr",align:null},"Microsoft Platform Engineering: Azure Open AI SDK Demo - Completions")))),(0,r.kt)("p",null,"REFERENCE : ",(0,r.kt)("a",{parentName:"p",href:"https://learn.microsoft.com/en-us/azure/cognitive-services/openai/concepts/models"},"Azure OpenAI Service models"))),(0,r.kt)(l.Z,{value:"openai",label:"Open AI",mdxType:"TabItem"},(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Program Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Package"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"ZP_MSAISDKDEMO_COMPLETION_OAI")),(0,r.kt)("td",{parentName:"tr",align:null},"ZPENGG_OAI_DEMOS"),(0,r.kt)("td",{parentName:"tr",align:null},"MS AI SDK for SAP : Demo program for Open AI Completions")))))),(0,r.kt)("admonition",{type:"tip"},(0,r.kt)("p",{parentName:"admonition"},"Review the demo program along with the content of this page to understand the use of AI SDK feature. The demo program was imported to your SAP Application server as part of AI SDK Installation.")),(0,r.kt)("h2",{id:"operations"},"Operations"),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Operation"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},(0,r.kt)("a",{parentName:"strong",href:"#completions---create"},"Create"))),(0,r.kt)("td",{parentName:"tr",align:null},"With the Completions operation, the model will generate one or more predicted completions based on a provided prompt. The service can also return the probabilities of alternative tokens at each position.")))),(0,r.kt)("hr",null),(0,r.kt)("h3",{id:"completions---create"},"Completions - Create"),(0,r.kt)("admonition",{type:"caution"},(0,r.kt)("p",{parentName:"admonition"},"The model which is deployed has a profound impact on the completions. For example, codex models are pretty good at code completions, but not so good at text completions. The opposite is true for davinci models. The best way to find out which model is best for your use case is to try them out.")),(0,r.kt)("p",null,"With the Completions operation, the model will generate one or more predicted completions based on a provided prompt. The service can also return the probabilities of alternative tokens at each position."),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:'language-title="Completions',metastring:'- Create"',"-":!0,'Create"':!0},"DATA:\n  completions_input  TYPE zif_peng_azoai_sdk_types=>ty_completion_input,\n  completions_output TYPE zif_peng_azoai_sdk_types=>ty_completion_output.\n\nsdk_instance->completions( )->create(\n  EXPORTING\n    deploymentid = deployment_id\n    prompts      = completions_input\n  IMPORTING\n    statuscode   = status_code\n    statusreason = status_reason    \n    response     = completions_output\n    error        = error\n).\n")),(0,r.kt)("h4",{id:"parameters-and-exceptions"},"Parameters and Exceptions"),(0,r.kt)(o.Z,{mdxType:"Tabs"},(0,r.kt)(l.Z,{value:"params",label:"Parameters",default:!0,mdxType:"TabItem"},(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Parameter"),(0,r.kt)("th",{parentName:"tr",align:null},"Direction"),(0,r.kt)("th",{parentName:"tr",align:null},"Data Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"deploymentid")),(0,r.kt)("td",{parentName:"tr",align:null},"EXPORTING"),(0,r.kt)("td",{parentName:"tr",align:null},"string"),(0,r.kt)("td",{parentName:"tr",align:null},"Deployment ID on which this completion must be run")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"prompts")),(0,r.kt)("td",{parentName:"tr",align:null},"EXPORTING"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#completion-input"},"Completions Input")),(0,r.kt)("td",{parentName:"tr",align:null},"Prompts. Each prompt will be processed to generate completion. Usually, there will be 1 prompt being sent - however, SDK supports multiple prompts as well. The number of responses generated for each prompt depends on ",(0,r.kt)("strong",{parentName:"td"},"n")," parameter of the prompt")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"statuscode")),(0,r.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,r.kt)("td",{parentName:"tr",align:null},"Integer"),(0,r.kt)("td",{parentName:"tr",align:null},"Response Code.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"statusreason")),(0,r.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,r.kt)("td",{parentName:"tr",align:null},"String"),(0,r.kt)("td",{parentName:"tr",align:null},"Status Description/Reason")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"response")),(0,r.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#completion-output"},"Completions Output")),(0,r.kt)("td",{parentName:"tr",align:null},"ABAP Ready completion result.")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"error")),(0,r.kt)("td",{parentName:"tr",align:null},"IMPORTING"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#error"},"Error")),(0,r.kt)("td",{parentName:"tr",align:null},"ABAP Ready error structure, if operation resulted in an error"))))),(0,r.kt)(l.Z,{value:"exception",label:"Exceptions",mdxType:"TabItem"},(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"ZCX_PENG_AZOAI_SDK_EXCEPTION")," - Raised if an error occured during processing."),(0,r.kt)("admonition",{type:"caution"},(0,r.kt)("p",{parentName:"admonition"},(0,r.kt)("strong",{parentName:"p"},"The exception is not raised")," if an error occured during AI Engine processing. In such situations, the ",(0,r.kt)("strong",{parentName:"p"},"ov_error")," parameter will provide error details. The exception is raised only if SDK encouters a situation where it cannot proceed with the requested operation.")))),(0,r.kt)("h4",{id:"responsesstatus-code"},"Responses/Status Code"),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Name"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Structure Populated"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"200 OK")),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#completion-output"},"Completions Output")),(0,r.kt)("td",{parentName:"tr",align:null},"response"),(0,r.kt)("td",{parentName:"tr",align:null},"Success")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"Other Status Codes")),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("a",{parentName:"td",href:"/aisdkforsapabap/docs/working-with-sdk/type-definitions#error"},"Error")),(0,r.kt)("td",{parentName:"tr",align:null},"error"),(0,r.kt)("td",{parentName:"tr",align:null},"An error occurred.")))),(0,r.kt)("hr",null))}g.isMDXComponent=!0},5412:(e,t,a)=>{a.d(t,{ZP:()=>p});var n=a(7462),r=(a(7294),a(3905)),o=a(4866),l=a(5162);const i={toc:[]},s="wrapper";function p(e){let{components:t,...a}=e;return(0,r.kt)(s,(0,n.Z)({},i,a,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"AI Engine and Versions"),": "),(0,r.kt)(o.Z,{groupId:"aienginechoice",mdxType:"Tabs"},(0,r.kt)(l.Z,{value:"azoai",label:"Azure Open AI",default:!0,mdxType:"TabItem"},(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("strong",{parentName:"li"},"2022-12-01")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("strong",{parentName:"li"},(0,r.kt)("em",{parentName:"strong"},"2023-03-15-preview"))),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("strong",{parentName:"li"},"2023-05-15")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("strong",{parentName:"li"},(0,r.kt)("em",{parentName:"strong"},"2023-06-01-preview"))),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("strong",{parentName:"li"},(0,r.kt)("em",{parentName:"strong"},"2023-07-01-preview"))),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("strong",{parentName:"li"},(0,r.kt)("em",{parentName:"strong"},"2023-08-01-preview"))))),(0,r.kt)(l.Z,{value:"openai",label:"Open AI",mdxType:"TabItem"},(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("strong",{parentName:"li"},"v1"))))))}p.isMDXComponent=!0}}]);