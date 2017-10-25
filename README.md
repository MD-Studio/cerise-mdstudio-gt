[![Docker Build Status](https://img.shields.io/docker/build/mdstudio/cerise-mdstudio-gt.svg)](https://hub.docker.com/r/mdstudio/cerise-mdstudio-gt/)

# Cerise specialisation for MDStudio and GT

This repository contains a Cerise specialisation for MDStudio and the VU GT cluster.

It's work in progress.

## Running

### Install the service via Docker

Get the specialised service from Docker:

```bash
docker pull mdstudio/cerise-mdstudio-gt:develop
```

Once installed, the service can be used from cerise-client.


## Legal Notes

### gromit

This repository contains a modified copy of gromit.sh from
[gromit](https://github.com/Tsjerk/gromit) in
api/files/mdstudio/gromit/gromit_mpi.sh. Gromit is licensed under the GNU
General Public License version 2.0 (see the file LICENSE_GROMIT).

### Other files

The rest of this repository is covered by the following license grant:

   Copyright 2017 Netherlands eScience Center and VU University Amsterdam

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
