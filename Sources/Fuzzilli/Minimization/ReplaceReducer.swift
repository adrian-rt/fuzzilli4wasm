// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Attemplts to replace code snippets with other, potentially shorter snippets.
struct ReplaceReducer: Reducer {
    func reduce(_ program: Program, with verifier: ReductionVerifier) -> Program {
        for instr in program {
            switch instr.operation {
            case let op as Construct:
                // Try replacing with a simple call
                let newOp = CallFunction(numArguments: op.numArguments)
                verifier.tryReplacing(instructionAt: instr.index, with: Instruction(operation: newOp, inouts: instr.inouts), in: program)
            default:
                break
            }
        }
        
        return program
    }
}
