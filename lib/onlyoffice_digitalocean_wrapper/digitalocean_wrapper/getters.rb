module OnlyofficeDigitaloceanWrapper
  # Get image, droplet by metadata
  module Getters
    def get_image_id_by_name(image_name)
      assure_correct_token
      all_droplets = @client.images.all
      image = all_droplets.find { |x| x.name == image_name }
      raise DigitalOceanImageNotFound, image_name if image.nil?
      OnlyofficeLoggerHelper.log("get_image_id_by_name(#{image_name}): #{image.id}")
      image.id
    end

    # Get droplet by its name
    # @param [String] droplet_name
    # @return [DropletKit::Droplet] droplet
    def droplet_by_name(droplet_name)
      assure_correct_token
      droplets = @client.droplets.all
      droplets.find { |x| x.name == droplet_name }
    end

    def get_droplet_id_by_name(droplet_name)
      droplet = droplet_by_name(droplet_name)
      if droplet.nil?
        OnlyofficeLoggerHelper.log("get_droplet_id_by_name(#{droplet_name}): not found any droplets")
        nil
      else
        OnlyofficeLoggerHelper.log("get_droplet_id_by_name(#{droplet_name}): #{droplet.id}")
        droplet.id
      end
    end

    def get_droplet_ip_by_name(droplet_name)
      droplet = droplet_by_name(droplet_name)
      if droplet.nil?
        OnlyofficeLoggerHelper.log("There is no created droplet with name: #{droplet_name}")
        return
      end
      ip = droplet.networks.first.first.ip_address
      OnlyofficeLoggerHelper.log("get_droplet_ip_by_name(#{droplet_name}): #{ip}")
      ip
    end

    def get_droplet_status_by_name(droplet_name)
      droplet = droplet_by_name(droplet_name)
      if droplet.nil?
        OnlyofficeLoggerHelper.log("get_droplet_status_by_name(#{droplet_name}): not found any droplets")
        nil
      else
        status = droplet.status
        status = :locked if droplet.locked
        OnlyofficeLoggerHelper.log("get_droplet_status_by_name(#{droplet_name}): #{status}")
        status
      end
    end
  end
end
