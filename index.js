"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
const child_process_1 = require("child_process");
const fs = __importStar(require("fs"));
const ikemenPath = '../Ikemen-GO/bin/Ikemen_GO_Linux'; // Path to the Ikemen_GO executable
const chars = fs.readdirSync('../Ikemen-GO/chars/'); // Characters directory
function runBattle() {
    const p1 = chars[Math.floor(Math.random() * chars.length)];
    const p2 = chars[Math.floor(Math.random() * chars.length)];
    const aiLevel = 8; // Set AI level (adjust as needed)
    const command = `${ikemenPath} -p1 ${p1} -p1.ai ${aiLevel} -p2 ${p2} -p2.ai ${aiLevel} -r -nojoy`;
    console.log(`Executing: ${command}`);
    (0, child_process_1.exec)(command, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error: ${error.message}`);
            return;
        }
        if (stderr) {
            console.error(`stderr: ${stderr}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
        runBattle(); // Start the next battle after the current one finishes
    });
}
runBattle();
