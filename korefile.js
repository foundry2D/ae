let fs = require('fs');
let path = require('path');
let project = new Project('New Project');
project.addDefine('HXCPP_API_LEVEL=332');
project.targetOptions = {"html5":{},"flash":{},"android":{},"ios":{}};
project.setDebugDir('build/linux');
await project.addProject('build/linux-build');
await project.addProject('/home/jsnadeau/Documents/KodeStudio/resources/app/kodeExtensions/kha/Kha');
resolve(project);
