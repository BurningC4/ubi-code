# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

FROM registry.access.redhat.com/ubi8/ubi-minimal

# Environment variables
ENV LC_CTYPE C.UTF-8

# Setup scripts for CODE
ADD /scripts/install-code-el8.sh /
ADD /repo/CODE-el8.repo /etc/yum.repos.d/
RUN bash install-code-el8.sh
RUN rm -rf /install-code-el8.sh

# Start script for CODE
ADD /scripts/start-code.sh /
ADD /scripts/start-code.pl /

EXPOSE 9980

# switch to cool user (use numeric user id to be compatible with Kubernetes Pod Security Policies)
USER 998

# Entry point
CMD ["bash /start-code.sh"]
