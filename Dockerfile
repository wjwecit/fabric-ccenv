FROM ibmblockchain/fabric-baseimage:x86_64-0.4.6
COPY payload/chaintool payload/protoc-gen-go /usr/local/bin/
ADD payload/goshim.tar.bz2 $GOPATH/src/
RUN mkdir -p /chaincode/input /chaincode/output
RUN npm set registry http://192.168.134.131:4873/
COPY node_modules /chaincode/output/node_modules
LABEL org.hyperledger.fabric.version=1.1.0 \
      org.hyperledger.fabric.base.version=0.4.6
