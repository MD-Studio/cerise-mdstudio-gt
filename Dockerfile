FROM cerise
MAINTAINER Lourens Veen <l.veen@esciencecenter.nl>

COPY api /home/cerise/api
RUN chown -R cerise:cerise /home/cerise/api

COPY known_hosts /home/cerise/.ssh/
RUN chown -R cerise:cerise /home/cerise/.ssh/known_hosts

