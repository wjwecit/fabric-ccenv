FROM hyperledger/fabric-ccenv:x86_64-1.1.0
#COPY payload/chaintool payload/protoc-gen-go /usr/local/bin/
#ADD payload/goshim.tar.bz2 $GOPATH/src/
#RUN mkdir -p /chaincode/input /chaincode/output
RUN npm config set registry https://registry.npm.taobao.org/
COPY package.json /chaincode/output/package.json
WORKDIR /chaincode/output
RUN npm install --product
RUN rm -f package.json
LABEL org.hyperledger.fabric.version=1.1.0 \
      org.hyperledger.fabric.base.version=0.4.6
