"use strict";(self.webpackChunkaisdkdocumentation=self.webpackChunkaisdkdocumentation||[]).push([[1],{3905:(e,t,n)=>{n.d(t,{Zo:()=>p,kt:()=>h});var r=n(7294);function i(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function o(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function a(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?o(Object(n),!0).forEach((function(t){i(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):o(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function s(e,t){if(null==e)return{};var n,r,i=function(e,t){if(null==e)return{};var n,r,i={},o=Object.keys(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||(i[n]=e[n]);return i}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(i[n]=e[n])}return i}var l=r.createContext({}),c=function(e){var t=r.useContext(l),n=t;return e&&(n="function"==typeof e?e(t):a(a({},t),e)),n},p=function(e){var t=c(e.components);return r.createElement(l.Provider,{value:t},e.children)},u="mdxType",f={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},d=r.forwardRef((function(e,t){var n=e.components,i=e.mdxType,o=e.originalType,l=e.parentName,p=s(e,["components","mdxType","originalType","parentName"]),u=c(n),d=i,h=u["".concat(l,".").concat(d)]||u[d]||f[d]||o;return n?r.createElement(h,a(a({ref:t},p),{},{components:n})):r.createElement(h,a({ref:t},p))}));function h(e,t){var n=arguments,i=t&&t.mdxType;if("string"==typeof e||i){var o=n.length,a=new Array(o);a[0]=d;var s={};for(var l in t)hasOwnProperty.call(t,l)&&(s[l]=t[l]);s.originalType=e,s[u]="string"==typeof e?e:i,a[1]=s;for(var c=2;c<o;c++)a[c]=n[c];return r.createElement.apply(null,a)}return r.createElement.apply(null,n)}d.displayName="MDXCreateElement"},6645:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>l,contentTitle:()=>a,default:()=>f,frontMatter:()=>o,metadata:()=>s,toc:()=>c});var r=n(7462),i=(n(7294),n(3905));const o={sidebar_position:1,title:"Overview",description:"Overview of AI SDK Enterprise Control feature."},a=void 0,s={unversionedId:"enterprise-control/overview",id:"enterprise-control/overview",title:"Overview",description:"Overview of AI SDK Enterprise Control feature.",source:"@site/docs/4-enterprise-control/1-overview.md",sourceDirName:"4-enterprise-control",slug:"/enterprise-control/overview",permalink:"/aisdkforsapabap/docs/enterprise-control/overview",draft:!1,tags:[],version:"current",sidebarPosition:1,frontMatter:{sidebar_position:1,title:"Overview",description:"Overview of AI SDK Enterprise Control feature."},sidebar:"tutorialSidebar",previous:{title:"Enterprise Control",permalink:"/aisdkforsapabap/docs/category/enterprise-control"},next:{title:"Using Enterprise Control",permalink:"/aisdkforsapabap/docs/enterprise-control/entcontrol-initialize"}},l={},c=[{value:"AI SDK Enterprise Control",id:"ai-sdk-enterprise-control",level:2}],p={toc:c},u="wrapper";function f(e){let{components:t,...o}=e;return(0,i.kt)(u,(0,r.Z)({},p,o,{components:t,mdxType:"MDXLayout"}),(0,i.kt)("h2",{id:"ai-sdk-enterprise-control"},"AI SDK Enterprise Control"),(0,i.kt)("p",null,"The AI SDK for SAP offers a range of capabilities that are essential for effective use of AI in an enterprise system. These capabilities include models, deployments, files, fine-tuning, and completions. While completions are the most visible and immediate use case for AI, the underlying setup activities are critical for ensuring accurate and reliable outputs."),(0,i.kt)("p",null,(0,i.kt)("img",{alt:"iceberg",src:n(4411).Z,width:"1907",height:"898"})),(0,i.kt)("p",null,"It's important to approach the use of AI in an enterprise system like SAP with the same level of planning, governance, and oversight as any other critical system. Organizations must establish clear policies and guidelines around who can perform specific activities within the AI SDK for SAP, as well as how AI-generated outputs are used and interpreted."),(0,i.kt)("p",null,"For example, policies may dictate that only a specific group of users can perform activities such as fine-tuning a model or deploying a model, while others may only be permitted to use the completions feature. Furthermore, clear guidelines should be established around how AI-generated outputs are used in making business decisions, including a process for verifying the accuracy and reliability of the model and its assumptions."),(0,i.kt)("p",null,"By implementing these policies and guidelines, organizations can ensure that the use of AI in their enterprise systems aligns with their values and goals, while also protecting sensitive data and processes. Ultimately, the effective use of AI in an enterprise system like SAP can offer significant benefits in terms of efficiency, accuracy, and insight, but it requires careful planning, governance, and ongoing monitoring."),(0,i.kt)("p",null,"The AI SDK for SAP offers an ",(0,i.kt)("strong",{parentName:"p"},"Enterprise Control feature that allows organizations to enforce their specific policies on SDK usage"),". Through a plug-in based programming model, organizations can implement their own plug-ins to enforce their policies. On a technical level, the plug-in is an ",(0,i.kt)("strong",{parentName:"p"},"ABAP class")," that must adhere to a specific interface. The SDK registers the plug-in class and calls its methods at specific points in the execution process. The plug-in class can then implement organization-specific policies in these methods."),(0,i.kt)("p",null,"The SDK provides a well-defined plug-in interface that includes the methods that must be implemented by the plug-in class. Organizations can use the interface to define policies around different aspects of AI usage, including model training, deployment, and output interpretation. The methods provided by the interface can be used to enforce policies related to access control, data protection, and quality assurance."),(0,i.kt)("p",null,"The plug-in interface ensures that organizations can align their AI usage with their business goals and effectively enforce their policies. By implementing a plug-in class that adheres to the interface, organizations can ensure that their policies are properly enforced and that their AI usage is consistent with their objectives."),(0,i.kt)("p",null,"Overall, the Enterprise Control feature of the AI SDK for SAP provides organizations with a flexible and powerful mechanism to enforce their policies around AI usage."))}f.isMDXComponent=!0},4411:(e,t,n)=>{n.d(t,{Z:()=>r});const r=n.p+"assets/images/iceberg_illustration-b9c6f9874b89c586a807ba750e3e1d1e.jpg"}}]);