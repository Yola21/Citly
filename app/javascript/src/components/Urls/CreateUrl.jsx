import React, { useState } from "react";
import UrlForm from "components/Urls/Form/UrlForm";

const CreateUrl = ({ url, setUrl, loading, handleSubmit }) => {
  return (
    <UrlForm
      url={url}
      setUrl={setUrl}
      loading={loading}
      handleSubmit={handleSubmit}
    />
  );
};

export default CreateUrl;